class OrderShippingAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :item_prefecture_id, :city, :address, :building, :phone_number, :order, :user_id, :item_id, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :city 
    validates :address
    validates :token
    validates :phone_number, format: {with: /\A\d{10,11}\z/, message: "is invalid. Include hyphen(-)"}
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  end
  validates :item_prefecture_id, numericality: {other_than: 1, message: "can't be blank"}


def save
  order = Order.create(item_id: item_id, user_id: user_id)
  ShippingAddress.create(postal_code: postal_code, item_prefecture_id: item_prefecture_id, city: city, address: address, building: building, phone_number: phone_number, order_id: order.id)
end
end