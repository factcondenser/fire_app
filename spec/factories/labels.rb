FactoryBot.define do
  factory :label do
    user
    name { Faker::Lorem.unique.words(number: rand(1..3)) }
  end
end
