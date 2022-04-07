require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品できる場合' do
      it '必須項目が全てあれば出品できる' do
        expect(@item).to be_valid
      end
    end
    context '商品出品できない場合' do
      it 'imageが空では保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('画像は必須項目です')
      end

      it 'nameが空では保存できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('商品名は必須項目です')
      end

      it 'explanationが空では保存できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の説明は必須項目です')
      end

      it 'category_idが---では保存できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('カテゴリーは必須項目です。')
      end

      it 'status_idが---では保存できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の状態は必須項目です。')
      end

      it 'cost_idが---では保存できない' do
        @item.cost_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('配送料の負担は必須項目です。')
      end

      it 'source_idが---では保存できない' do
        @item.source_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('発送元の地域は必須項目です。')
      end

      it 'shipment_idが---では保存できない' do
        @item.shipment_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('発送までの日数は必須項目です。')
      end

      it 'priceが空では保存できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は必須項目です')
      end

      it 'priceが300以下では保存できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は300~9999999(半角)まで設定可能です。カンマは省略して記載してください。')
      end

      it 'priceが9999999以上では保存できない' do
        @item.price = '1000000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は300~9999999(半角)まで設定可能です。カンマは省略して記載してください。')
      end

      it 'priceに半角数字以外が含まれている場合は出品できない以外では保存できない' do
        @item.price = '１２３円'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は300~9999999(半角)まで設定可能です。カンマは省略して記載してください。')
      end

      it 'userが紐付いていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('ユーザーを入力してください')
      end
    end
  end
end
