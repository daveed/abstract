FactoryGirl.define do
  factory :discussion do
    title "Discussion Title"
    description "Some description about my discussion"
    association :author, factory: :user
  end
end
