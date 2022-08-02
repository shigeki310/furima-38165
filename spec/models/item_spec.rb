require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品が出品できる場合' do
      it '全ての項目の条件が記述できている時' do
        expect(@item).to be_valid
      end
    end

    context '商品が出品できない場合' do
      it 'ログインしていないと商品が出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include 'Userを入力してください'
      end
      it '画像が添付されていない時は出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "画像を入力してください"
      end
      it '商品名の記載がなければ出品できない' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "商品名を入力してください"
      end
      it '商品の説明がなければ出品できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "商品の説明を入力してください"
      end
      it 'カテゴリーを選択していなければ出品できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "カテゴリーを選択して下さい"
      end
      it 'カテゴリーに「---」が選択されている場合は出品できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include 'カテゴリーを選択して下さい'
      end
      it '商品の状態を選択していなければ出品できない' do
        @item.item_status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "商品の状態を入力してください"
      end
      it '商品の状態に「---」が選択されている場合は出品できない' do
        @item.item_status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include '商品の状態を選択して下さい'
      end
      it '配送料の負担を選択していなければ出品できない' do
        @item.shipping_cost_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "配送料の負担を入力してください"
      end
      it '配送料の負担に「---」が選択されている場合は出品できない' do
        @item.shipping_cost_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include '配送料の負担を選択して下さい'
      end
      it '発送元の地域を選択していなければ出品できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "発送元の地域を選択して下さい"
      end
      it '発送元の地域に「---」が選択されている場合は出品できない' do
        @item.prefecture_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include '発送元の地域を選択して下さい'
      end
      it '発送までの日にちを選択していなければ出品できない' do
        @item.shipping_date_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "発送までの日数を選択して下さい"
      end
      it '発送までの日にちに「---」が選択されている場合は出品できない' do
        @item.shipping_date_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include '発送までの日数を選択して下さい'
      end
      it '価格を入力していなければ出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "販売価格を入力してください"
      end
      it '価格は半角数値で入力しなければ出品できない' do
        @item.price = '10_000'
        @item.valid?
        expect(@item.errors.full_messages).to include '販売価格は整数で入力してください'
      end
      it '価格は300円より少ない金額では出品できない' do
        @item.price = '200'
        @item.valid?
        expect(@item.errors.full_messages).to include '販売価格は300以上の値にしてください'
      end
      it '価格は9,999,999円より高い金額では出品できない' do
        @item.price = '100000000'
        @item.valid?
        expect(@item.errors.full_messages).to include '販売価格は9999999以下の値にしてください'
      end
    end
  end
end
