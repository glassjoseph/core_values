class Tagging < ApplicationRecord
  belongs_to :taggable, :polymorphic => true
  belongs_to :tag

  validates_uniqueness_of :tag_id, :scope => [:taggable_id, :taggable_type]


end
