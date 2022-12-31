FactoryBot.define do
  factory :labeling do
    label { create(:label, :with_user) }

    trait :expense do
      labelable { create(:expense, :with_created_by) }
    end

    trait :income do
      labelable { create(:income, :with_created_by) }
    end
  end
end
