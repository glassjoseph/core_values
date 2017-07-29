class Score < ApplicationRecord
  belongs_to :daily

  scope :created_between, lambda {|start_date, end_date| where("date >= ? AND date <= ?", start_date, end_date )}
end
