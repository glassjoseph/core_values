class Resource < ApplicationRecord
  include Taggable
  belongs_to :user

end
