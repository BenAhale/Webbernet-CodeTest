FactoryBot.define do
  factory :prompt do
    project { "" }
    body { "MyText" }
    title { "MyText" }
    kind { 1 }
    status { 1 }
  end
end
