FactoryBot.define do
  factory :project do
    title { 'Test Building' }
    active { true }

    trait :with_team do
      association :team
    end
  end
end
