class List < ApplicationRecord
  validates_presence_of :name
  has_many :items

  belongs_to :user, dependent: :destroy
  has_many :shared_lists
  has_many :users, through: :shared_lists
end
