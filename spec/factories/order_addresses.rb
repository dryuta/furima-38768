FactoryBot.define do
  factory :order_address do
    zip_code { Faker::Number.decimal_part(digits: 3) + '-' + Faker::Number.decimal_part(digits: 4) }
    prefecture_id { Faker::Number.between(from: 1, to: 47) }
    city { Faker::Address.city }
    address { Faker::Address.street_address }
    building { Faker::Address.street_address }
    telephone { Faker::Number.decimal_part(digits: 11) }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
