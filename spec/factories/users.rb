FactoryBot.define do
  factory :user do
    nickname              { Faker::Internet.username }
    email                 { Faker::Internet.email }
    password              { '123abc' }
    password_confirmation { password }
    first_name            { Gimei.name.first.kanji }
    last_name             { Gimei.name.last.kanji }
    first_name_kana       { Gimei.name.first.katakana }
    last_name_kana        { Gimei.name.last.katakana }
    birthday              { Faker::Date.between(from: '1930-01-01', to: '2015-12-31') }
  end
end
