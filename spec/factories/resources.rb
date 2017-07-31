FactoryGirl.define do
  factory :resource do
    resource_type "resource_type"
    content "This is resource text"
    notes "These are notes"
    user
  end
end
