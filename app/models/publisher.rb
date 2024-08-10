class Publisher < ApplicationRecord
  # belongs_to :organizations
  # below statment looks for user_id in Publisher table 
  belongs_to :user
  # has_and_belongs_to_many :organizations
  has_many :press_releases

  before_create :set_created_at
  before_update :set_updated_at

  validates :name, presence: true
  validates :description, presence: true
  validates :website_url, presence: true


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
