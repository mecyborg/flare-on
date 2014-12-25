class User < ActiveRecord::Base
  #attr_accessible :email, :password, :password_confirmation
  #has_many :notifications
  attr_accessor :password
  before_save :encrypt_password
  before_save :create_unique_profile_id
  #before_save :add_credits
  
  
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
end



def create_unique_profile_id
    begin
      self.profile_id=SecureRandom.base64(8)
    end while self.class.exists?(:profile_id =>profile_id)
  end

  