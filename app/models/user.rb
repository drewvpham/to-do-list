class User < ActiveRecord::Base
  has_secure_password


  validates_presence_of :username
  validates :username, uniqueness: { case_sensitive: false }

  validates :password, on: :create, presence: true, length: 6..32
  has_many :items, dependent: :destroy


  has_many :lists, dependent: :destroy
  has_many :shared_lists, dependent: :destroy
  has_many :lists_shared, through: :shared_lists, source: :list



  def all_lists
    self.lists + self.lists_shared
  end

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
