FactoryBot.define do
  factory :fragrance do
    name { Faker::TvShows::RuPaul.queen }
    x { rand(10) }
    y { rand(10) }
  end
end