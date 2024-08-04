class Publisher < ApplicationRecord

  has_many :PressRelease

  validates :name, :description, presence: true
end
