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
  end

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
  end

end
