class User < ApplicationRecord
  has_secure_password
  has_many :dailies
  has_many :journals
  has_many :resources
  has_one :supporter
  validates :first_name, :last_name, :email, :password, presence: true
  validates :email, uniqueness: true


  def all_scores_list
    user_dailies = dailies
    user_dailies.map{|daily| daily.scores_list}.reduce(:+)
  end

  def full_name
    "#{first_name} #{last_name}"
  end

end
