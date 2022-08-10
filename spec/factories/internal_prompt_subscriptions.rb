FactoryBot.define do
  factory :internal_prompt_subscription do
    prompt_subscription { nil }
    project { nil }
    project_prompt_invitation_token { }

    trait :with_invitation_token do
      association :project_prompt_invitation_token, :with_project
    end

    trait :with_prompt_subscription do
      association :prompt_subscription, :with_project
    end
  end
end
