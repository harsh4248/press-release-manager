class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :organizations
  has_many :publishers
  validates :firstname, :lastname, presence: true

  
  enum role: { publisher: 0, organization: 1, user: 2 }
end
