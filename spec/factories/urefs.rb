FactoryBot.define do
  factory :uref do
    token { "MyString" }
    first_name { "MyString" }
    last_name { "MyString" }
    project { nil }

    trait :with_project do
      association :project, :with_team
    end
  end
end
