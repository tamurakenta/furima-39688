class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_user!, except: [:index, :show]


  def index
  end
 
  private

  def item_params
    params.require(:item).permit(:nickname, :email, :password, :password_confirmation, :last_name, :first_name, :last_name_kana, :first_name_kana, :birth_date).merge(user_id: current_user.id)
  end

  def set_item
    @item = item.find(params[:id])
  end

  def contributor_confirmation
    redirect_to root_path unless current_user == @item.user
  end
end


