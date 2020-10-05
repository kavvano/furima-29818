FactoryBot.define do
  factory :link_item do
    post_num { "123-4567" }
    area_id  { Faker::Number.within(range: 2..48) }
    city     { Gimei.address.city.kanji }
    address  { Faker::Address.street_address }
    building { "プラート中洲" }
    cell_num { Faker::PhoneNumber.subscriber_number(length: 11) }
    token    { "tok_5a2fe06d6b7b223444062fcaafbe" }
  end
end
