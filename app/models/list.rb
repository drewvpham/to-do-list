class List < ApplicationRecord
  validates_presence_of :name
  has_many :items, dependent: :destroy
  belongs_to :user
  has_many :shared_lists
  has_many :users, through: :shared_lists
end
