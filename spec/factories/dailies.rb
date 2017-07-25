FactoryGirl.define do
  factory :daily do
    goal "Exercise"
    user

    factory :daily_with_scores do
      after(:create) do |daily|
        daily.scores << create_list(:score, 7)
        create(:supporter, daily_id: daily.id)
      end
    end
  end
end
