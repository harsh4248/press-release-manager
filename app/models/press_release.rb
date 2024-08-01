class PressRelease < ApplicationRecord
  belongs_to :user
  belongs_to :publisher

  validates :title, :content, :publish_date, presence: true
end
