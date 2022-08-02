require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
  end

  describe '商品購入' do
    context '商品が購入できる場合' do
      it '全ての項目が正しく入力されていれば購入できること' do
        expect(@order_address).to be_valid
      end
      it 'buildingは空でも購入できること' do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end
    end

    context '商品が購入できない場合' do
      it 'postal_codeが空では購入できない' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "郵便番号を入力してください"
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと購入できない' do
        @order_address.postal_code = '1112222'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "郵便番号は-(ハイフン)を含む形で入力して下さい"
      end
      it 'prefecture_idが空では購入できない' do
        @order_address.prefecture_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "都道府県を入力してください"
      end
      it 'prefecture_idが「---」が選択されていると購入できない' do
        @order_address.prefecture_id = '0'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include '都道府県を選択してして下さい'
      end
      it 'cityが空では購入できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "市区町村を入力してください"
      end
      it 'blockが空では購入できない' do
        @order_address.block = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "番地を入力してください"
      end
      it 'phone_numberが空では購入できない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "電話番号を入力してください"
      end
      it 'phone_numberが半角数字12桁以上入力すると購入できない' do
        @order_address.phone_number = '0901111222233'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include '電話番号は不正な値です'
      end
      it 'phone_numberが半角数字8桁以下の入力だと購入できない' do
        @order_address.phone_number = '01201234'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "電話番号は不正な値です"
      end
      it 'phone_numberにハイフンがると購入できない' do
        @order_address.phone_number = '090-1234-1234'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include '電話番号は不正な値です'
      end
      it 'user_idが紐付いていないと購入できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Userを入力してください"
      end
      it 'item_idが紐付いていないと購入できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Itemを入力してください"
      end
      it 'tokenが空では購入できない' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "カード情報を入力してください"
      end
    end
  end
end
