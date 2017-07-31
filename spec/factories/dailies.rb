FactoryGirl.define do
  factory :daily do
    goal "Exercise?"
    user

    factory :daily_with_scores do
      after(:create) do |daily|
        daily.scores.create!(score: (rand(9) + 1 ), date: 1.day.ago.to_date)
        daily.scores.create!(score: (rand(9) + 1 ), date: 2.days.ago.to_date)
        daily.scores.create!(score: (rand(9) + 1 ), date: 3.days.ago.to_date)
        daily.scores.create!(score: (rand(9) + 1 ), date: 4.days.ago.to_date)
        daily.scores.create!(score: (rand(9) + 1 ), date: 5.days.ago.to_date)
        daily.scores.create!(score: (rand(9) + 1 ), date: 6.days.ago.to_date)
        daily.scores.create!(score: (rand(9) + 1 ), date: 7.days.ago.to_date)
        create(:supporter, daily_id: daily.id)
      end
    end
  end
end
