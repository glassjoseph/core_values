class Daily < ApplicationRecord
  belongs_to :user
  has_many :taggings, :as => :taggable
  has_many :tags, through: :taggings
  has_many :journals, dependent: :destroy
  has_many :scores, dependent: :destroy
  has_one :supporter, dependent: :destroy


  def weeks_scores
    results = self.scores.created_between((Date.today - 7), Date.today).order(:date).pluck(:score)

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
