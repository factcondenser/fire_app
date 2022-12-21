FactoryBot.define do
  factory :income do
    created_by factory: :user, strategy: :null
    incurred_by { nil }
    category { nil }
    amount { Faker::Number.decimal(l_digits: 2) }
    description { Faker::Lorem.sentence }
    incurred_at { nil }
  end
end
