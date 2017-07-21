class Journal < ApplicationRecord
  belongs_to :user
  belongs_to :daily, optional: true
  has_many :taggings, :as => :taggable
  has_many :tags, through: :taggings
end
