class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :prevent_url, only: [:index, :create]


  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @item = Item.find(params[:item_id])
    @order_shipping_address = OrderShippingAddress.new
    if current_user == @item.user
      redirect_to root_path
    end
  end

  def create
    @item = Item.find(params[:item_id])
    @order_shipping_address = OrderShippingAddress.new(order_params)
    if @order_shipping_address.valid?
       pay_item 
       @order_shipping_address.save
       redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end


  private

  def order_params
    params.require(:order_shipping_address).permit(:postal_code, :item_prefecture_id, :city, :address, :building, :phone_number, :order, :item_image, :address, :price).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def shipping_address_params
    params.premit(:postal_code, :item_prefecture_id, :city, :building, :phone_number, :order, :item_image, :address).merge(order_id: @order.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item[:price], 
      card: order_params[:token],
      currency: 'jpy' 
    )
  end

  def prevent_url
    @item = Item.find(params[:item_id])
    if @item.user_id == current_user.id || @item.order != nil
      redirect_to root_path
    end
  end

end
