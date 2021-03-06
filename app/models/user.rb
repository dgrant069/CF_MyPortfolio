class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :omniauthable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email,
                  :password,
                  :password_confirmation,
                  :remember_me,
                  :name,
                  :uid,
                  :role,
                  :provider,
                  :time_zone

  # attr_accessible :title, :body
  validates_presence_of :email
  validates_uniqueness_of :email

  has_many :posts, foreign_key: "author_id", :dependent => :destroy
  has_many :projects, foreign_key: "author_id", :dependent => :destroy


  def self.from_twitter_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.nickname
      user.email = "#{user.uid}-CHANGEME@#{user.provider}.com"
      user.role = 'author'
    end
  end

  def self.from_facebook_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.nickname
      user.oauth_token = auth.credentials.token
      user.email = "#{user.uid}-CHANGEME@#{user.provider}.com"
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.role = 'author'
    end
  end

  def self.from_google_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.email = auth.info.email
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.role = 'author'
    end
  end

  def self.from_linkedin_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.email = "#{user.uid}-CHANGEME@#{user.provider}.com"
      user.role = 'author'
    end
  end

  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"], without_protection: true) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end

  def password_required?
    super && provider.blank?
  end

  def update_with_password(params, *options)
    if encrypted_password.blank?
      update_attributes(params, *options)
    else
      super
    end
  end

  def author?
    role == 'author'
  end

  def editor?
    role == 'editor'
  end
end
