FactoryBot.define do
  factory :expense_category do
    association :user, strategy: :null
    name { Faker::Lorem.unique.words(number: rand(1..3)) }

    trait :with_parent do
      parent { create(:expense_category, user:) }
    end
  end
end
