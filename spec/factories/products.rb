FactoryBot.define do
  factory :product do
    name               {'test'}
    explanation        {'test'}
    category_id        {2}
    situation_id       {2}
    delivery_charge_id {2}
    prefecture_id      {2}
    number_of_day_id   {2}
    price              {'1000'}
    association :user

    after(:build) do |product|
      product.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
