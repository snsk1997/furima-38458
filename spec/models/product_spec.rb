require 'rails_helper'

RSpec.describe Product, type: :model do
  
  before do
    @product = FactoryBot.build(:product)
  end

  describe '商品の出品' do
    context '商品の出品ができる場合' do
      it 'image, name, explanation, category_id, situation_id, delivery_charge_id, prefecture_id, number_of_day_id, priceが存在していれば出品できる' do
        expect(@product).to be_valid
      end
    end
    context '商品の出品ができない場合' do
      it 'imageが空白では出品できない' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空白では出品できない' do
        @product.name = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Name can't be blank")
      end
      it 'explanationが空白では出品できない' do
        @product.explanation = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'category_idが---の場合は出品できない' do
        @product.category_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Category can't be blank")
      end
      it 'situation_idが---の場合は出品できない' do
        @product.situation_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Situation can't be blank")
      end
      it 'delivery_charge_idが---の場合は出品できない' do
        @product.delivery_charge_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Delivery charge can't be blank")
      end
      it 'prefecture_idが---の場合は出品できない' do
        @product.prefecture_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'number_of_day_idが---の場合は出品できない' do
        @product.number_of_day_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Number of day can't be blank")
      end
      it 'pirceが空白の場合は出品できない' do
        @product.price = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが300より小さい場合は出品できない' do
        @product.price = '299'
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is out of setting range")
      end
      it 'priceが9999999より大きい場合は出品できない' do
        @product.price = '10000000'
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is out of setting range")
      end
      it 'priceが半角数字以外の場合は出品できない' do
        @product.price = 'test'
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is invalid. Input half-width characters")
      end
    end
  end

end
