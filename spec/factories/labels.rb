FactoryBot.define do
  factory :label do
    user { nil }
    name { Faker::Lorem.unique.words(number: rand(1..3)) }
    background_color { Faker::Color.hex_color }
    foreground_color { Faker::Color.hex_color }

    trait :with_user do
      user
    end
  end
end
