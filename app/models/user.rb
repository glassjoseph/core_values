class User < ApplicationRecord
  has_secure_password
  has_many :dailies
  has_many :journals

  validates :first_name, :last_name, :email, :password, presence: true
  validates :email, uniqueness: true

end
