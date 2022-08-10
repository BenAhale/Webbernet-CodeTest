FactoryBot.define do
  factory :summary do
    trait :with_subscription do
      association :email_subscription, :with_project
    end
  end
end
