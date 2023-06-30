FactoryBot.define do
  factory :fragrance do
    name { Faker::Lorem.unique }
    x { rand(10) }
    y { rand(10) }
  end
end