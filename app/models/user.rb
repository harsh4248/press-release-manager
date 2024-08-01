class User < ApplicationRecord

    has_secure_password

    validates :email, presence:true, uniqueness: true
    validates :role, presence: true, inclusion: { in: %w[admin editor] }
    validates :first_name, :last_name, presence: true

    has_many :press_releases
end
