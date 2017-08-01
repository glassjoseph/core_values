class Tag < ApplicationRecord
  has_many :taggings
  has_many :taggables, through: :taggings

  has_many :resources, through: :taggings, source: :taggable, source_type: "Resource"
  has_many :dailies, through: :taggings, source: :taggable, source_type: "Daily"
end
