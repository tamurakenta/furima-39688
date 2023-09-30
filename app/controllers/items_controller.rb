class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :prevent_url, only: [:edit, :update, :destroy]

    
  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end
 
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end


  def destroy
   if @item.user_id == current_user.id
    @item.destroy
  end
  redirect_to root_path
end

  def edit
    if @item.user_id != current_user.id
      redirect_to root_path     
    end
  end

  def show
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit, status: :unprocessable_entity
  end
end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:item_image, :item_name, :item_info, :item_category_id, :item_sales_status_id, :item_shipping_id, :item_prefecture_id, :item_scheduled_delivery_id, :price, :text, {images: []}).merge(user_id: current_user.id)
  end

  def prevent_url
    if @item.user_id != current_user.id || @item.order != nil #　コードを追加
      redirect_to root_path
    end
  end

end

