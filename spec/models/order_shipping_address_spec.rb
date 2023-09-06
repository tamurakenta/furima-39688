require 'rails_helper'

RSpec.describe OrderShippingAddress, type: :model do
  describe '商品購入記録の保存' do
    before do
      user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @order_shipping_address = FactoryBot.build(:order_shipping_address,user_id: user.id, item_id: @item.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_shipping_address).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @order_shipping_address.building = ''
        expect(@order_shipping_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できないこと' do
        @order_shipping_address.postal_code = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_shipping_address.postal_code = '1234567'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'item_prefecture_idを選択していないと保存できないこと' do
        @order_shipping_address.item_prefecture_id = 1
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Item prefecture can't be blank")
      end
      it 'addressが空だと保存できないこと' do
        @order_shipping_address.address = nil
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @order_shipping_address.phone_number = nil
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号は、10桁以上11桁以内の半角数値のみ保存可能なこと（良い例:09012345678 良くない例:090-1234-5678)' do
        @order_shipping_address.phone_number='123456789234'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Phone number is invalid. Include hyphen(-)")
      end
      it "tokenが空では登録できないこと" do
        @order_shipping_address.token =''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'userが紐付いていないと保存できないこと' do
        @order_shipping_address.user_id = nil
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("User can't be blank")
      end
      it '電話番号が9桁以下だと購入できないこと' do
        @order_shipping_address.phone_number = '090123456'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Phone number is invalid. Include hyphen(-)")
      end
      it '電話番号が12桁以上だと購入できない' do
        @order_shipping_address.phone_number = '090123456789'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Phone number is invalid. Include hyphen(-)")
      end
      it '電話番号が半角数値でないと購入できないこと' do
        @order_shipping_address.phone_number = '０9012341234'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Phone number is invalid. Include hyphen(-)")
      end
      it 'item_idが紐づいていなければ購入できないこと' do
        @order_shipping_address.user_id = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("User can't be blank")
      end
    end
  end
end