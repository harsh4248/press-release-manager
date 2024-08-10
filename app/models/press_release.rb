class PressRelease < ApplicationRecord
  belongs_to :user
  belongs_to :publisher
  belongs_to :organization

  validates :title, presence: true
  validates :content, presence: true
end
