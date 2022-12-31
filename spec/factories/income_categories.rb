FactoryBot.define do
  factory :income_category do
    user { nil }
    name { Faker::Company.name }

    trait :with_user do
      user
    end

    trait :with_parent do
      parent { create(:income_category, user:) }
    end
  end
end
