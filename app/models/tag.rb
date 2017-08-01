class Tag < ApplicationRecord
  has_many :taggings
  has_many :taggables, through: :taggings

  has_many :resources, through: :taggings, source: :taggable, source_type: "Resource"
end
