class Publisher < ApplicationRecord
  belongs_to :organizations
  belongs_to :users
  # has_and_belongs_to_many :organizations
  has_many :press_releases
end
