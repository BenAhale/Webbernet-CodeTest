FactoryBot.define do
  factory :email_prompt_detail do
    prompt { nil }
    to { "MyString" }
    from { "MyString" }
  end
end
