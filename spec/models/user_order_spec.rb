require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  describe '寄付情報の保存' do
    before do
      @user_order = FactoryBot.build(:user_order)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@user_order).to be_valid
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
      @user_order.prefecture = 0
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'priceが空だと保存できないこと' do
      @user_donation.price = nil
      @user_donation.valid?
      expect(@user_donation.errors.full_messages).to include("Price can't be blank")
    end
    it 'priceが全角数字だと保存できないこと' do
      @user_donation.price = '２０００'
      @user_donation.valid?
      expect(@user_donation.errors.full_messages).to include("Price is invalid. Input half-width characters.")
    end
    it 'priceが1円未満では保存できないこと' do
      @user_donation.price = 0
      @user_donation.valid?
      expect(@user_donation.errors.full_messages).to include("Price is out of setting range")
    end
    it 'priceが1,000,000円を超過すると保存できないこと' do
      @user_donation.price = 1000001
      @user_donation.valid?
      expect(@user_donation.errors.full_messages).to include("Price is out of setting range")
    end
  end
end