class Publisher < ApplicationRecord

  has_many :press_releases

  validates :name, :description, presence: true
end
