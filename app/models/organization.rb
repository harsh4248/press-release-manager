class Organization < ApplicationRecord

  
  # has_many :publishers
  # has_many :users
  # belongs_to :users
  belongs_to :user
  # has_many :publishers
  # has_many :users
  
  before_create :set_created_at
  before_update :set_updated_at

  validates :name, presence: true
  validates :description, presence: true
  validates :contact_email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone_number, presence: true, format: { with: /\A\d{10}\z/, message: "must be 10 digits" }

  def set_user_id
    self.user_id ||= User.current&.id
  end
  def set_created_at
    self.created_at = Time.current
  end

  def set_updated_at
    self.updated_at = Time.current
  end
end
