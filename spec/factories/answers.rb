FactoryBot.define do
  factory :answer do
    body { "MyText" }
    Question { nil }
  end
end
