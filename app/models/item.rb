class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :order

  belongs_to :item_category
  belongs_to :item_prefecture
  belongs_to :item_sales_status
  belongs_to :item_scheduled_delivery
  belongs_to :item_shipping
  has_one_attached :item_image

  validates :item_image, presence: true
  validates :item_name, presence: true
  validates :item_info, presence: true

  with_options presence: true do
    validates :price, numericality: { only_integer:true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                      presence: { message: "can't be blank" }
  end


  with_options presence: true, numericality: { other_than: 1, message: 'Select'} do
  validates :item_category_id
  validates :item_sales_status_id 
  validates :item_shipping_id
  validates :item_prefecture_id 
  validates :item_scheduled_delivery_id
  end
end
