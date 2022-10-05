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
        expect(@product.errors.full_messages).to include("画像を入力してください")
      end
      it 'nameが空白では出品できない' do
        @product.name = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("商品名を入力してください")
      end
      it 'explanationが空白では出品できない' do
        @product.explanation = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("商品の説明を入力してください")
      end
      it 'category_idが---の場合は出品できない' do
        @product.category_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("カテゴリーを選んでください")
      end
      it 'situation_idが---の場合は出品できない' do
        @product.situation_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("商品の状態を選んでください")
      end
      it 'delivery_charge_idが---の場合は出品できない' do
        @product.delivery_charge_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("配送料の負担を選んでください")
      end
      it 'prefecture_idが---の場合は出品できない' do
        @product.prefecture_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("発送元の地域を選んでください")
      end
      it 'number_of_day_idが---の場合は出品できない' do
        @product.number_of_day_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("発送までの日数を選んでください")
      end
      it 'pirceが空白の場合は出品できない' do
        @product.price = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("価格を入力してください")
      end
      it 'priceが300より小さい場合は出品できない' do
        @product.price = '299'
        @product.valid?
        expect(@product.errors.full_messages).to include("価格は金額の設定範囲外です")
      end
      it 'priceが9999999より大きい場合は出品できない' do
        @product.price = '10000000'
        @product.valid?
        expect(@product.errors.full_messages).to include("価格は金額の設定範囲外です")
      end
      it 'priceが半角数字以外の場合は出品できない' do
        @product.price = 'test'
        @product.valid?
        expect(@product.errors.full_messages).to include("価格は半角数字を入力してください")
      end
      it 'userが紐付いていないと出品できない' do
        @product.user = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Userを入力してください")
      end
    end
  end

end
