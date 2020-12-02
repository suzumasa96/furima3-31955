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
    context '商品出品ページへの遷移ができないとき' do
      it 'ログアウト状態のユーザーは商品出品ページへ遷移できない' do
        @item.item_name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
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
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it '商品の説明がないと出品できない' do
        @item.introduction = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Introduction can't be blank")
      end
      it 'カテゴリーの情報がないと出品できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category is not a number")
      end
      it 'カテゴリーの情報は１では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it '商品の状態についての情報がないと出品できない' do
        @item.condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition is not a number")
      end
      it '商品の状態についての情報は１では登録できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end
      it '配送料の負担についての情報がないと出品できない' do
        @item.shipping_cost_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping cost is not a number")
      end
      it '配送料の負担についての情報は１では登録できない' do
        @item.shipping_cost_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping cost must be other than 1")
      end
      it '発送元の地域についての情報がないと出品できない' do
        @item.destination_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Destination is not a number")
      end
      it '発送元の地域についての情報は１では登録できない' do
        @item.destination_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Destination must be other than 1")
      end
      it '配送までの日数についての情報がないと出品できない' do
        @item.shipping_date_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping date is not a number")
      end
      it '配送までの日数についての情報は１では登録できない' do
        @item.shipping_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping date must be other than 1")
      end
      it '価格についての情報がないと出品できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
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
