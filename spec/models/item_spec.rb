require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @user = FactoryBot.build(:user)
  end

  describe '商品情報入力' do
    context '新規登録できるとき' do
    it '全ての値が正しく入力されていれば出品できること' do
      item = FactoryBot.build(:item)
      expect(@item).to be_valid
    end
  end


  context '商品情報の入力がうまく行かない時' do
    it 'imageが空だと出品できない' do
      @item.item_image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Item image can't be blank")
  end
   it 'item_nameが空だと出品できない' do
        @item.item_name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
   end
   it 'item_infoが空だと出品できない' do
    @item.item_info = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Item info can't be blank")
  end
  it 'categoryが未選択だと出品できない' do
    @item.item_category_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Item category Select")
  end
  it 'item_conditionが未選択だと出品できない' do
    @item.item_sales_status_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Item sales status Select")
  end
  it 'postageが未選択だと出品できない' do
    @item.item_shipping_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Item shipping Select")
  end
  it 'prefectureが未選択だと出品できない' do
    @item.item_prefecture_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Item prefecture Select")
  end
  it 'prepareが未選択だと出品できない' do
    @item.item_scheduled_delivery_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Item scheduled delivery Select")
  end
  it 'priceが空だと出品できない' do
    @item.price = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Price can't be blank")
  end
  it 'priceが全角数字だと出品できない' do
    @item.price = "２０００"
    @item.valid?
    expect(@item.errors.full_messages).to include("Price is not a number")
  end
  it 'priceが¥300より少ない時は出品できない' do
    @item.price = "299"
    @item.valid?
    expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
  end
  it 'priceが¥9999999より少ない時は出品できない' do
    @item.price = "10_000_000"
    @item.valid?
    expect(@item.errors.full_messages).to include("Price must be an integer")
  end
  it 'userが紐付いていなければ出品できない' do
    @item.user = nil
    @item.valid?
    expect(@item.errors.full_messages).to include('User must exist')
  end
 end
end
end

