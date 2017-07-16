class List < ApplicationRecord
  validates_presence_of :name
  has_many :items, dependent: :destroy
  belongs_to :user
end
