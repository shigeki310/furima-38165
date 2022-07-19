require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
    end
    it 'emailが空では登録できない' do
    end
    it 'passwordが空では登録できない' do
    end
    it 'passwordが5文字以下では登録できない' do
    end
    it 'passwordが129文字以上では登録できない' do
    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do
    end
    it '重複したemailが存在する場合は登録できない' do
    end
    it 'emailは@を含まないと登録できない' do
    end
    it 'family_nameが空では登録できない' do
    end
    it 'given_nameが空では登録できない' do
    end
    it 'family_name_kanaが空では登録できない' do
    end
    it 'given_name_kanaが空では登録できない' do
    end
    it 'family_nameが全角以外では登録できない' do
    end
    it 'given_nameが全角以外では登録できない' do
    end
    it 'family_name_kanaが全角カナ以外では登録できない' do
    end
    it 'given_name_kanaが全角カナ以外では登録できない' do
    end
    it 'birthdayが空では登録できない' do
    end

  end
end
