class User < ActiveRecord::Base
  has_secure_password
  validates_presence_of :email, :username
  validates :email, :username, uniqueness: true
  has_many :lists, dependent: :destroy




  def self.find_or_create_by_omniauth(auth_hash)
    oauth_email=auth_hash['info']['email']
    username=auth_hash['info']['nickname']
    # image= auth_hash['info']['image']
    # location = auth_hash['extra']['location']
    self.where(email: auth_hash['info']['email']).first_or_create do |user|
    user.password=SecureRandom.hex
    # user.image=auth_hash['extra']['raw_info']['avatar_url']
    # user.location=auth_hash['extra']['raw_info']['location']
    user.username=auth_hash['info']['nickname']
    end
  end
end
