FactoryBot.define do
  factory :user do
    name                  {'test'}
    email                 {Faker::Internet.free_email}
    password              {'000sss'}
    password_confirmation {password}
    first_name_kanji      {'てすと'}
    last_name_kanji       {'てすと'}
    first_name_kana       {'テスト'}
    last_name_kana        {'テスト'}
    birthday              {'1999''12''27'}
  end
end