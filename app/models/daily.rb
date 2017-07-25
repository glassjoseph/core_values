class Daily < ApplicationRecord
  belongs_to :user
  # belongs_to :supporter
  has_many :taggings, :as => :taggable
  has_many :tags, through: :taggings
  has_many :journals
  has_many :scores
  has_one :supporter
end
