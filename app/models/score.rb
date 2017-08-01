class Score < ApplicationRecord
  belongs_to :daily
  validates :date, :score, presence: true
  validates_uniqueness_of :date, :scope => [:daily_id]

  scope :created_between, lambda {|start_date, end_date| where("date >= ? AND date <= ?", start_date, end_date )}
end
