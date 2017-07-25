FactoryGirl.define do
  factory :supporter do
    sequence :first_name do |n|
      "#{Faker::LordOfTheRings.character}#{n}"
    end
    sequence :last_name do |n|
      "#{Faker::LordOfTheRings.character}#{n}"
    end
    sequence :email do |n|
      n.to_s + Faker::Internet.email
    end
    user
    daily
  end
end
