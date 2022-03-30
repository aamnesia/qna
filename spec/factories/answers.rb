FactoryBot.define do
  sequence :body do |n|
    "answer_body#{n}"
  end

  factory :answer do
    body
    user

    trait :invalid do
      body { nil }
    end
  end
end
