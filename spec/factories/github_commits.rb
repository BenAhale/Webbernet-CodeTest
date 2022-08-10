FactoryBot.define do
  factory :github_commit do
    sha { "MyString" }
    branch { "MyString" }
    pusher_username { "MyString" }
    pusher_avatar { "MyString" }
    link { "MyString" }
    prompt { nil }
  end
end
