FactoryBot.define do
  factory :income do
    user
    category factory: :income_category
    amount { Faker::Number.decimal(l_digits: 2) }
    description { Faker::Lorem.sentence }
    incurred_at { Time.current }
  end
end
