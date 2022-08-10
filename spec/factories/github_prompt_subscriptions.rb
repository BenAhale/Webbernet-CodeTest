FactoryBot.define do
  factory :github_prompt_subscription do
    prompt_subscription { nil }
    branch { "MyString" }
    hook_url_token { "MyString" }
  end
end
