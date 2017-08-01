module Taggable
  extend ActiveSupport::Concern

  included do
    has_many :taggings, :as => :taggable
    has_many :tags, through: :taggings
  end


  def join_tags
    self.tags.collect do |tag|
      tag.name
    end.join(", ")
  end

  def tag_list(tags_string="")
    tags_string = join_tags if tags_string.nil? || tags_string.empty?
    tag_names = tags_string.split(",").collect{|s| s.strip.downcase}.uniq
    new_or_found_tags = tag_names.collect { |name| Tag.find_or_create_by(name: name)}
    new_or_found_tags.each {|tag| self.tags << tag unless self.tags.include?(tag)}
    tags_to_remove = self.tags - new_or_found_tags
    self.tags.delete(tags_to_remove)
  end
end
