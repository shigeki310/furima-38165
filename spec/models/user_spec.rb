require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it '全ての項目の条件を満たしていれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できない場合' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "ニックネームを入力してください"
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Eメールを入力してください"
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワードを入力してください"
      end
      it '英字のみのpasswordでは登録できない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include 'パスワード（確認用）とパスワードの入力が一致しません'
      end
      it '数字のみのpasswordでは登録できない' do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include 'パスワード（確認用）とパスワードの入力が一致しません'
      end
      it '全角文字を含むpasswordでは登録できない' do
        @user.password = 'Test@mail'
        @user.valid?
        expect(@user.errors.full_messages).to include 'パスワード（確認用）とパスワードの入力が一致しません'
      end
      it 'passswordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワード（確認用）とパスワードの入力が一致しません"
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include 'パスワードは6文字以上で入力してください'
      end
      it 'passwordが129文字以上では登録できない' do
        @user.password = Faker::Internet.password(min_length: 129)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include 'パスワードは128文字以内で入力してください'
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include 'Eメールはすでに存在します'
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Eメールは不正な値です'
      end
      it 'family_nameが空では登録できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "名字を入力してください"
      end
      it 'given_nameが空では登録できない' do
        @user.given_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "名前を入力してください"
      end
      it 'family_name_kanaが空では登録できない' do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "名字(カナ)を入力してください"
      end
      it 'given_name_kanaが空では登録できない' do
        @user.given_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "名前(カナ)を入力してください"
      end
      it 'family_nameは全角(漢字・ひらがな・カタカナ)でなければ登録できない' do
        @user.family_name = 'kana'
        @user.valid?
        expect(@user.errors.full_messages).to include '名字は不正な値です'
      end
      it 'given_nameは全角(漢字・ひらがな・カタカナ)でなければ登録できない' do
        @user.given_name = 'kana'
        @user.valid?
        expect(@user.errors.full_messages).to include '名前は不正な値です'
      end
      it 'family_name_kanaは全角(カタカナ)でなければ登録できない' do
        @user.family_name_kana = 'かな'
        @user.valid?
        expect(@user.errors.full_messages).to include '名字(カナ)は不正な値です'
      end
      it 'given_name_kanaが全角(カタカナ)でなければ登録できない' do
        @user.given_name_kana = 'かな'
        @user.valid?
        expect(@user.errors.full_messages).to include '名前(カナ)は不正な値です'
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "生年月日を入力してください"
      end
    end
  end
end
