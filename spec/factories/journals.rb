FactoryGirl.define do
  factory :journal do
    title "Journal Title"
    content "Journal content"
    user
    daily
  end
end
