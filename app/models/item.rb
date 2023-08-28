class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :order
  has_one_attached :item_image


  validates :item_image, presence: true

  validates :item_name, presence: true
  validates :item_info, presence: true

  validates :price, presence: true, format: { with: /\A[0-9]+\z/, message: "Half-width number" }, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_99_999, message: "Out of setting range" }

  with_options presence: true, numericality: { other_than: 1, message: 'Select'} do
  validates :item_category_id
  validates :item_sales_status_id 
  validates :item_shipping_id
  validates :item_prefecture_id 
  validates :item_category_id
 end
end

