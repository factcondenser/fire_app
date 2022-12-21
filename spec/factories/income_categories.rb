FactoryBot.define do
  factory :income_category do
    association :user, strategy: :null
    name { Faker::Company.name }

    trait :with_parent do
      parent { create(:income_category, user:) }
    end
  end
end
