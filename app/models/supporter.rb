class Supporter < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :daily, optional: true

  validates :first_name, :last_name, :email, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end

end
