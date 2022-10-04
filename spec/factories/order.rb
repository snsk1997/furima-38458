FactoryBot.define do
  factory :order do
    token         {"tok_abcdefghijk00000000000000000"}
    post_code     {'123-4567'}
    prefecture_id {2}
    municipality  {'Test市'}
    address       {'Test1111'}
    phone_number  {'09012345678'}
  end
end
