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
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
      it 'post_codeが空では購入できない' do
        @order.post_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeは「3桁ハイフン4桁」の半角数値でなければ購入できない' do
        @order.post_code = '1234'
        @order.valid?
        expect(@order.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it 'prefecture_idが---の場合は購入できない' do
        @order.prefecture_id = 0
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'municipalityが空では購入できない' do
        @order.municipality = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'addressが空では購入できない' do
        @order.address = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空では購入できない' do
        @order.phone_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberは半角数値でなければ購入できない' do
        @order.phone_number = '１２３４５６７８９０'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid. Input half-width characters")
      end
      it 'phone_numberが10桁以上でなければ購入できない' do
        @order.phone_number = '12345'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is too short")
      end 
      it 'phone_numberが11桁以下でなければ購入できない' do
        @order.phone_number = '1234567890000'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is too long")
      end
      it 'user_idが紐付いていないと購入できない' do
        @order.user_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("User can't be blank")
      end
      it 'product_idが紐付いていないと購入できない' do
        @order.product_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Product can't be blank")
      end
    end
  end
end
