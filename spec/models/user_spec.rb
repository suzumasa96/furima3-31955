require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'ユーザー登録ができるとき' do
      it 'すべての値が正常に入力されていれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordは6文字以上の半角英数字混合で登録できる' do
        @user.password = 'a0a0a0'
        @user.password_confirmation = 'a0a0a0'
        expect(@user).to be_valid
      end
    end

    context 'ユーザー登録ができないとき' do
      it 'nameが空だと登録できない' do
        @user.name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it 'emailが空では登録できない' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it 'emailは重複すると登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
      end
      it 'emailはaaaでは登録できない' do
        @user.email = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールは不正な値です")
      end
      it 'passwordが空では登録できない' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'passwordは英字のみの場合登録できない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません", "パスワードは不正な値です")
      end
      it 'passwordは数字のみの場合登録できない' do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません", "パスワードは不正な値です")
      end
      it 'passwordは6文字以下だと登録できない' do
        @user.password = 'aaa11'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字を入力してください")
      end
      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字(かな)を入力してください")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください")
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("名前(かな)を入力してください")
      end
      it 'last_nameが全角入力でなければ登録できない' do
        @user.last_name = 'ｱｲｳｴｵ'
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字は不正な値です")
      end
      it 'first_nameが全角入力でなければ登録できない' do
        @user.first_name = "ｱｲｳｴｵ"
        @user.valid?
        expect(@user.errors.full_messages).to include("名前は不正な値です")
      end
      it 'last_name_kanaが全角カタカナでなければ登録できない' do
        @user.last_name_kana = 'あいうえお'
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字(かな)は不正な値です")
      end
      it 'first_name_kanaが全角カタカナでなければ登録できない' do
        @user.first_name_kana = 'あいうえお'
        @user.valid?
        expect(@user.errors.full_messages).to include("名前(かな)は不正な値です")
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include
      end
    end
  end
end
