require 'rails_helper'

RSpec.describe BuyAddress, type: :model do 
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @buy = FactoryBot.build(:buy_address, user_id: @user.id, item_id: @item.id)
    sleep 0.1
  end

  describe '商品購入' do
    context '商品購入できる場合' do
      it '必須項目が全てあれば出品できる' do
        expect(@buy).to be_valid
      end

      it 'address_buildingが空でも保存できる' do
        @buy.address_building = ''
        expect(@buy).to be_valid
      end

    end
    context '商品購入できない場合' do
      it '郵便番号が空では保存できない' do
        @buy.postal_code = ''
        @buy.valid?
        expect(@buy.errors.full_messages).to include('Postal code は必須項目です')
      end

      it '郵便番号がハイフンなしでは保存できない' do
        @buy.postal_code = '1111111'
        @buy.valid?
        expect(@buy.errors.full_messages).to include('Postal code は000-0000の形でのみ登録可能です')
      end

      it '郵便番号が全角数字では保存できない' do
        @buy.postal_code = '１１１１１１１'
        @buy.valid?
        expect(@buy.errors.full_messages).to include('Postal code は000-0000の形でのみ登録可能です')
      end

      it '郵便番号が3桁-4桁の形でしか保存できない' do
        @buy.postal_code = '1111ー111'
        @buy.valid?
        expect(@buy.errors.full_messages).to include('Postal code は000-0000の形でのみ登録可能です')
      end

      it 'address_city' do
        @buy.address_city = ''
        @buy.valid?
        expect(@buy.errors.full_messages).to include('Address city は必須項目です')
      end

      it 'address_streetが空では保存できない' do
        @buy.address_street = ''
        @buy.valid?
        expect(@buy.errors.full_messages).to include('Address street は必須項目です')
      end

      it 'source_idが---では保存できない' do
        @buy.source_id = 1
        @buy.valid?
        expect(@buy.errors.full_messages).to include('Source は必須項目です')
      end

      it 'phone_numberが空では保存できない' do
        @buy.phone_number = ''
        @buy.valid?
        expect(@buy.errors.full_messages).to include('Phone number は必須項目です')
      end

      it 'phone_numberが9桁以下では保存できない' do
        @buy.phone_number = '1111'
        @buy.valid?
        expect(@buy.errors.full_messages).to include('Phone number は10から11桁の半角数字でのみ登録可能です')
      end

      it 'phone_numberが12桁以上では保存できない' do
        @buy.phone_number = '11111111111111'
        @buy.valid?
        expect(@buy.errors.full_messages).to include('Phone number は10から11桁の半角数字でのみ登録可能です')
      end

      it 'phone_numberが半角数値以外は保存できない' do
        @buy.phone_number = '１１１１２２２２３３'
        @buy.valid?
        expect(@buy.errors.full_messages).to include('Phone number は10から11桁の半角数字でのみ登録可能です')
      end

      it 'phone_numberが-を含めると保存できない' do
        @buy.phone_number = '111-111-111'
        @buy.valid?
        expect(@buy.errors.full_messages).to include('Phone number は10から11桁の半角数字でのみ登録可能です')
      end

      it 'userが紐付いていなければ購入できない' do
        @buy.user_id = nil
        @buy.valid?
        expect(@buy.errors.full_messages).to include("User can't be blank")
      end

      it 'itemが紐付いていなければ購入できない' do
        @buy.item_id = nil
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Item can't be blank")
      end

    end
  end
end
