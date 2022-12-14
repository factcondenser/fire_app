FactoryBot.define do
  factory :income do
    user
    association :category, factory: :income_category
    amount { Faker::Number.decimal(l_digits: 2) }
    description { Faker::Lorem.sentence }
  end
end
