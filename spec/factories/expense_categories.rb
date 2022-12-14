FactoryBot.define do
  factory :expense_category do
    name { Faker::Commerce.department }

    trait :with_parent do
      association :parent, factory: :expense_category
    end
  end
end
