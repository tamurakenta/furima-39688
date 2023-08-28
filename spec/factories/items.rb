FactoryBot.define do
  factory :item do
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end                 
    item_name                  {'testname'}
    item_info                  {'aaa'}
    item_category_id           {2}
    item_sales_status_id       {2}
    item_shipping_id           {2}
    item_prefecture_id         {2}
    item_scheduled_delivery_id {2}
    price                      {300}
  end
end