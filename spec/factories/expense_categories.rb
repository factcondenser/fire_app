FactoryBot.define do
  factory :expense_category do
    user
    name { Faker::Lorem.unique.words(number: rand(1..3)) }

    trait :with_parent do
      parent factory: :expense_category
    end
  end
end
