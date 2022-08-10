FactoryBot.define do
  factory :category do
    title { "MyString" }
    project { nil }

    trait :with_project do
      association :project, :with_team
    end

  end
end
