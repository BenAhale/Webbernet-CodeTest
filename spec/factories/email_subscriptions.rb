FactoryBot.define do
  factory :email_subscription do
    project { nil }
    email { "MyString" }
  end

  trait :with_project do
    association :project, :with_team
  end
end
