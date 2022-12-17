FactoryBot.define do
  factory :label do
    name { Faker::IndustrySegments.sector }
  end
end
