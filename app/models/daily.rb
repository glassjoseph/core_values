class Daily < ApplicationRecord
  belongs_to :user
  has_many :taggings, :as => :taggable
  has_many :tags, through: :taggings
  has_many :journals, dependent: :destroy
  has_many :scores, dependent: :destroy
  has_one :supporter, dependent: :destroy

end
