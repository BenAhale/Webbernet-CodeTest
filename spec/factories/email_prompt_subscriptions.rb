FactoryBot.define do
  factory :email_prompt_subscription do
    email_prefix_token { "MyString" }
    association :prompt_subscription

    trait :with_project do
      association :project
    end
  end
end
