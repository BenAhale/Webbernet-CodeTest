FactoryBot.define do
  factory :release do
    title { 'Test Building' + SecureRandom.hex(10) }
    public_key { SecureRandom.uuid }

    trait :with_project do
      association :project, :with_team
    end

    trait :with_user do
      association :user, :with_team
    end
  end
end
