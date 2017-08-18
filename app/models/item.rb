class Item < ApplicationRecord
  validates_presence_of :description
  belongs_to :list, dependent: :destroy

  def complete?
    self.completion==true
  end

  def incomplete?
    self.completion==false
  end

end
