class List < ApplicationRecord
  validates_presence_of :name
  has_many :items
  # , -> { order(created_at: :desc) }, dependent: :destroy
    # , -> { order(completion: :asc) }
  belongs_to :user
  has_many :shared_lists, dependent: :destroy
  has_many :users, through: :shared_lists
end
