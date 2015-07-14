class User < ActiveRecord::Base
  # attr_accessible :email, :password, :password_confirmation
  attr_accessor :remember_token, :activation_token, :reset_token
  has_many :notifications
  attr_accessor :password
  before_save :encrypt_password
  before_create :confirmation_token
  # before_save :create_unique_profile_id
  # before_save :add_credits
  has_many :answers, dependent: :destroy
  has_many :ques_follows, dependent: :destroy
  has_many :authorizations
  # validates :first_name,:email, :presence => true
  has_attached_file :avatar, styles: { medium: '200x200>', thumb: '60x60>', tiny: '40x40>' },
                             url: '/system/users/:id_partition/:style/:hash.:extension',
                             hash_secret: 'akfahudagwlgauwgiualsdauyingacbbahdgkabshdabdsga',
                             default_url: 'default_user/:style/default_avatar.jpg'
  validates_attachment_content_type :avatar, content_type: %r{/image/.*/}
  # validates_confirmation_of :password
  validates_presence_of :password, on: :create
  validates_presence_of :email
  validates_presence_of :profile_name
  validates_uniqueness_of :email
  validates_uniqueness_of :profile_name

  # validates_presence_of :first_name
  # validates_presence_of :last_name
  has_many :following, through: :active_relationships, source: :followed

  has_many :active_relationships, class_name:  'Relationship',
                                  foreign_key: 'follower_id',
                                  dependent:   :destroy
  has_many :passive_relationships, class_name:  'Relationship',
                                   foreign_key: 'followed_id',
                                   dependent:   :destroy

  has_many :followers, through: :passive_relationships, source: :follower

  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    end
  end

  def encrypt_password
    return unless password.present?
    self.password_salt = BCrypt::Engine.generate_salt
    self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
  end

  def email_activate
    self.email_confirmed = true
    self.confirm_token = nil
    save!(validate: false)
  end

  # Sets the password reset attributes.
  def create_reset_digest
    self.reset_token = User.new_token
    update_attribute(:reset_digest,  User.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end

  # Sends password reset email.
  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end

  def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end

  def self.new_token
    SecureRandom.urlsafe_base64
  end

  # Returns the hash digest of the given string.
  def self.digest(string)
    if cost == ActiveModel::SecurePassword.min_cost
      BCrypt::Engine::MIN_COST
    else
      BCrypt::Engine.cost
    end
    BCrypt::Password.create(string, cost: cost)
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
end

def create_unique_profile_id
  loop do
    self.profile_id = SecureRandom.base64(8)
    break self.class.exists?(profile_id: profile_id)
  end
end

private

def confirmation_token
  self.confirm_token = SecureRandom.urlsafe_base64.to_s if confirm_token.blank?
end
