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
      it "ログインしていないと商品が出品できない" do
      end
      it "画像が添付されていない時は出品できない" do
      end
      it "商品名の記載がなければ出品できない" do
      end
      it "商品名は40文字以上では出品できない" do
      end
      it "商品の説明がなければ出品できない" do
      end
      it "カテゴリーを選択していなければ出品できない" do
      end
      it "商品の状態を選択していなければ出品できない" do
      end
      it "配送料の負担を選択していなければ出品できない" do
      end
      it "発送元の地域を選択していなければ出品できない" do
      end
      it "発送までの日にちを選択していなければ出品できない" do
      end
      it "価格を入力していなければ出品できない" do
      end
      it "価格は半角数値で入力しなければ出品できない" do
      end
      it "価格は300円より少ない金額では出品できない" do
      end
      it "価格は9,999,999円より高い金額では出品できない" do
      end
    end
  end
end
