require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品ページへの遷移' do
    context '商品出品ページへの遷移ができるとき' do
      it 'ログイン状態のユーザーは商品出品ページへ遷移できる' do
        expect(@item).to be_valid
      end
    end
  end

  describe '商品の出品' do
    context '商品の出品ができるとき' do
      it '販売価格は半角数字のみ保存可能であること' do
        @item.price = '300'
        expect(@item).to be_valid
      end
    end

    context '商品の出品ができないとき' do
      it '商品画像がないと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include()
      end
      it '商品名がないと出品できない' do
        @item.item_name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it '商品の説明がないと出品できない' do
        @item.introduction = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end
      it 'カテゴリーの情報がないと出品できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーは数値で入力してください")
      end
      it 'カテゴリーの情報は１では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーは1以外の値にしてください")
      end
      it '商品の状態についての情報がないと出品できない' do
        @item.condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態は数値で入力してください")
      end
      it '商品の状態についての情報は１では登録できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態は1以外の値にしてください")
      end
      it '配送料の負担についての情報がないと出品できない' do
        @item.shipping_cost_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担は数値で入力してください")
      end
      it '配送料の負担についての情報は１では登録できない' do
        @item.shipping_cost_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担は1以外の値にしてください")
      end
      it '発送元の地域についての情報がないと出品できない' do
        @item.destination_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域は数値で入力してください")
      end
      it '発送元の地域についての情報は１では登録できない' do
        @item.destination_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域は1以外の値にしてください")
      end
      it '配送までの日数についての情報がないと出品できない' do
        @item.shipping_date_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数は数値で入力してください")
      end
      it '配送までの日数についての情報は１では登録できない' do
        @item.shipping_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数は1以外の値にしてください")
      end
      it '価格についての情報がないと出品できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("価格を入力してください", "価格は数値で入力してください", "価格は不正な値です")
      end
      it '価格の範囲が、¥299以下の場合登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include()
      end
      it '価格の範囲が、¥10,000,000以上の場合登録できない' do
        @item.price  = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include()
      end
      it '価格が半角数字以外の時保存できない' do
        @item.price = 'aaa'
        @item.valid?
        expect(@item.errors.full_messages).to include()
      end
    end
  end
end
