class Journal < ApplicationRecord

  has_many :taggings, :as => :taggable
  has_many :tags, through: :taggings
  belongs_to :user
  belongs_to :daily, optional: true

end
