FactoryBot.define do
  factory :expense do
    user
    association :category, factory: :expense_category
    amount { Faker::Number.decimal(l_digits: 2) }
    description { Faker::Lorem.sentence }
    incurred_at { Time.current }
  end
end
