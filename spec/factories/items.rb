FactoryBot.define do
  factory :item do
    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/test_image.png'), filename: 'test_image.png')
    end
    title           { Faker::Lorem.word }
    explanation     { Faker::Lorem.characters }
    category_id     { Faker::Number.within(range: 2..11) }
    status_id       { Faker::Number.within(range: 2..7) }
    delivery_fee_id { Faker::Number.within(range: 2..3) }
    area_id         { Faker::Number.within(range: 2..48) }
    days_id         { Faker::Number.within(range: 2..4) }
    price           { Faker::Number.within(range: 300..9_999_999) }
    association     :user
  end
end
