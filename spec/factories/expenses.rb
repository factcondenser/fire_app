FactoryBot.define do
  factory :expense do
    created_by factory: :user, strategy: :null
    incurred_by { nil }
    category { nil }
    amount { Faker::Number.decimal(l_digits: 2) }
    description { Faker::Lorem.sentence }
    incurred_at { nil }

    trait :with_created_by do
      created_by factory: :user
    end
  end
end
