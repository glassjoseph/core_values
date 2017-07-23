FactoryGirl.define do
  sequence(:random_score) do |n|
      @random_score ||= (1..10).to_a.shuffle
      @random_score[n]
    end

  factory :score do
    score {generate(:random_score)}
    date Date.today
    daily
  end
end
