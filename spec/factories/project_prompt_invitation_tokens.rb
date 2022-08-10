FactoryBot.define do
  factory :project_prompt_invitation_token do
    expiry { (Time.zone.now + 5.days).to_i }
    token { 123 + rand(10...10000) }
    used { false }

    trait :with_project do
      association :project, :with_team
    end

  end
end
