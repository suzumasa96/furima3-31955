require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'すべての値が正常に入力されていればうまくいく' do
      expect(@user).to be_valid
    end
    it 'nameが空だと登録できない' do
      @user.name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include
    end
    it 'emailが重複していたら登録できない' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include
    end
    it 'passwordは6文字以上で登録できる' do
      @user.password = 'a00000'
      @user.password_confirmation = 'a00000'
      expect(@user).to be_valid
    end
    it 'last_nameが空では登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include
    end
    it 'last_name_kanaが空では登録できない' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include
    end
    it 'first_nameが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include
    end
    it 'first_name_kanaが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include
    end
    it 'birthdayが空では登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include
    end
  end
end
