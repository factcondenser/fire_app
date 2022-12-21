FactoryBot.define do
  factory :label do
    association :user, strategy: :null
    name { Faker::Lorem.unique.words(number: rand(1..3)) }
  end
end
