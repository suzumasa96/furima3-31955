require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  before do
    @user_order = FactoryBot.build(:user_order)
  end

  describe 'クレジット情報の保存' do
    context 'クレジット情報の保存ができるとき'do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@user_order).to be_valid
      end
      it 'building_numberがなくても登録できる' do
        @user_order.building_number = nil
        expect(@user_order).to be_valid
      end
    end

    context 'クレジット情報の保存が出来ないとき' do
      it 'user_idが無いと保存ができないこと' do
        @user_order.user_id = ''
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが無いと保存ができないこと' do
        @user_order.item_id = ''
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Item can't be blank")
      end
      it 'post_codeが空だと保存できないこと' do
        @user_order.post_code = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @user_order.post_code = '1234567'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it 'prefectureを選択していないと保存できないこと' do
        @user_order.prefecture_id = 0
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Prefecture Select")
      end
      it 'tellは12桁以上では登録できないこと' do
        @user_order.tell = '123456789012'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Tell at least 11 digit")
      end
      it 'tellは英数混合では登録できないこと' do
        @user_order.tell = '1a2b3c'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Tell is half-width numerical value")
      end
    end
  end
end