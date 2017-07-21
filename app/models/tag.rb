class Tag < ApplicationRecord
  has_many :taggings
  has_many :taggables, through: :taggins 
end
