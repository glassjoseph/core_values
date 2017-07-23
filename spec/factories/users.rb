FactoryGirl.define do

  factory :user do
    sequence :first_name do |n|
      "#{Faker::LordOfTheRings.character}#{n}"
    end
    sequence :last_name do |n|
      "#{Faker::LordOfTheRings.character}#{n}"
    end
    sequence :email do |n|
      n.to_s + Faker::Internet.email
    end
    password "password"


    factory :user_with_dailies do
      after(:create) do |user|
        3.times do
          user.dailies << create(:daily_with_scores)
        end
      end
    end


  end
end
