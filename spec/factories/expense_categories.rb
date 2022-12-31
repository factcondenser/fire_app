FactoryBot.define do
  factory :expense_category do
    user { nil }
    name { Faker::Lorem.unique.words(number: rand(1..3)) }

    trait :with_user do
      user
    end

    trait :with_parent do
      parent { create(:expense_category, user:) }
    end
  end
end
