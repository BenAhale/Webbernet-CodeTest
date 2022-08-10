FactoryBot.define do
  factory :form_prompt_subscription_reminder do
    form_prompt_subscription { nil }
    email { "MyString" }
    interval_type { 1 }
    interval_value { 1 }
    start_datetime { 1 }
  end
end
