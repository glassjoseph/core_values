class Daily < ApplicationRecord
  include Taggable
  belongs_to :user
  has_many :journals, dependent: :destroy
  has_many :scores, dependent: :destroy
  has_one :supporter, dependent: :destroy
  accepts_nested_attributes_for :scores, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true

  def weeks_scores
    results = self.scores.created_between((Date.today - 7), Date.today)
    .order(:date).limit(7).pluck(:score)

    while results.length < 7
      results.unshift(nil)
    end
    results
  end

  def weeks_average
    results = self.scores.created_between((Date.today - 7), Date.today).order(date: :desc).pluck(:score)
    results.reduce(:+)/results.length unless results.empty?
  end

  def scores_list
    [[goal] + weeks_scores.map {|n| n || 0}]
  end

end
