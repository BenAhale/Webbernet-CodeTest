FactoryBot.define do
  factory :user do
    email      { "#{SecureRandom.hex(10)}@dsadsa" }
    password   { 'password' }
    first_name { 'John' }
    last_name  { 'Smith' }


    trait :with_team do
      association :team
    end
  end
end
