FactoryBot.define do
  factory :form_prompt_subscription do
    title { "MyString" }
    interval_type { 1 }
    interval_value { 1 }
    next_run { 1 }
  end

  trait :with_prompt_subscription do
    association :prompt_subscription, :with_project
  end
end
