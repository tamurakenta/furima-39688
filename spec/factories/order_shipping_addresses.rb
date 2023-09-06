FactoryBot.define do
  factory :order_shipping_address do
    postal_code { '123-4567' }
    item_prefecture_id { "2" }
    city { '東京都' }
    address { '1-1' }
    building { '東京ハイツ' }
    phone_number { '09012345678' }
    token {"tok_abcdefghijk00000000000000000"}

    association :user_id
    association :item_id
  end
end
