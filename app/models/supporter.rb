class Supporter < ApplicationRecord
  belongs_to :user
  belongs_to :daily

  validates :first_name, :last_name, :email, presence: true

end
