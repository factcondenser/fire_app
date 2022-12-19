FactoryBot.define do
  factory :income_category do
    name { Faker::Company.name }

    trait :with_parent do
      parent factory: :income_category
    end
  end
end
