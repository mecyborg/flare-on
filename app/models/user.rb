class User < ActiveRecord::Base
  #attr_accessible :email, :password, :password_confirmation
  has_many :notifications
  attr_accessor :password
  before_save :encrypt_password
  #before_save :create_unique_profile_id
  #before_save :add_credits
  has_many :answers, dependent: :destroy
  has_many :ques_follows, dependent: :destroy
  has_many :authorizations
  #validates :first_name,:email, :presence => true
  has_attached_file :avatar, :styles => { :medium => "200x200>", :thumb => "60x60>", :tiny => "40x40>" }, 
  :url => "/system/users/:id_partition/:style/:hash.:extension",
    :hash_secret => "akfahudagwlgauwgiualsdauyingacbbahdgkabshdabdsga",
  :default_url => ":style/default_avatar.jpg"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
 # validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_presence_of :profile_name
  validates_uniqueness_of :email
  validates_uniqueness_of :profile_name

  #validates_presence_of :first_name
  #validates_presence_of :last_name
  has_many :following, through: :active_relationships, source: :followed

  has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy
  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy
                                
  has_many :followers, through: :passive_relationships, source: :follower


  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    
      end
  end

  # Follows a user.
  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end

  # Unfollows a user.
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  # Returns true if the current user is following the other user.
  def following?(other_user)
    following.include?(other_user)
  end

   def add_provider(auth_hash)
  # Check if the provider already exists, so we don't add it twice
  unless authorizations.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
    Authorization.create :user => self, :provider => auth_hash["provider"], :uid => auth_hash["uid"]
  end
end 
end



def create_unique_profile_id
    begin
      self.profile_id=SecureRandom.base64(8)
    end while self.class.exists?(:profile_id =>profile_id)
  end




