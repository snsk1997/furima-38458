require 'rails_helper'

RSpec.describe Order, type: :model do
  
  before do
    user = FactoryBot.create(:user)
    product = FactoryBot.create(:product)
    @order = FactoryBot.build(:order, user_id: user.id, product_id: product.id)
    sleep 0.1
  end

  describe '商品の購入' do
    context '商品が購入できる場合' do
      it 'token, post_code, prefecture_id, municipality, address, phone_numberが存在していれば購入できる' do
        expect(@order).to be_valid
      end
      it '建物名が空でも購入できる' do
        @order.building_name = ''
        expect(@order).to be_valid
      end
    end
    context '商品が購入できない場合' do
      it 'tokenが空では購入できない' do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("クレジットカード情報を入力してください")
      end
      it 'post_codeが空では購入できない' do
        @order.post_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("郵便番号を入力してください")
      end
      it 'post_codeは「3桁ハイフン4桁」の半角数値でなければ購入できない' do
        @order.post_code = '1234'
        @order.valid?
        expect(@order.errors.full_messages).to include("郵便番号は(-)を含めてください")
      end
      it 'prefecture_idが---の場合は購入できない' do
        @order.prefecture_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include("都道府県を選んでください")
      end
      it 'municipalityが空では購入できない' do
        @order.municipality = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("市区町村を入力してください")
      end
      it 'addressが空では購入できない' do
        @order.address = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("番地を入力してください")
      end
      it 'phone_numberが空では購入できない' do
        @order.phone_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("電話番号を入力してください")
      end
      it 'phone_numberは半角数値でなければ購入できない' do
        @order.phone_number = '１２３４５６７８９０'
        @order.valid?
        expect(@order.errors.full_messages).to include("電話番号は半角数字を入力してください")
      end
      it 'phone_numberが10桁以上でなければ購入できない' do
        @order.phone_number = '12345'
        @order.valid?
        expect(@order.errors.full_messages).to include("電話番号が短過ぎます")
      end 
      it 'phone_numberが11桁以下でなければ購入できない' do
        @order.phone_number = '1234567890000'
        @order.valid?
        expect(@order.errors.full_messages).to include("電話番号が長過ぎます")
      end
      it 'user_idが紐付いていないと購入できない' do
        @order.user_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Userを入力してください")
      end
      it 'product_idが紐付いていないと購入できない' do
        @order.product_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Productを入力してください")
      end
    end
  end
end
