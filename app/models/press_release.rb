class PressRelease < ApplicationRecord
  belongs_to :users
  belongs_to :publishers
  belongs_to :organizations

  validates :title, presence: true
  validates :content, presence: true
end
