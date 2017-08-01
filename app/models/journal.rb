class Journal < ApplicationRecord
  include Taggable

  belongs_to :user
  belongs_to :daily, optional: true

end
