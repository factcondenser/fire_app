FactoryBot.define do
  factory :labeling do
    association :label, strategy: null

    trait :expense do
      labelable factory: :expense
    end

    trait :income do
      labelable factory: :income
    end
  end
end
