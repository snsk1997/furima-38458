require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it 'name, email, password, password_confirmation, first_name_kanji, last_name_kanji, first_name_kana, last_name_kana, birthdayが存在すれば保存できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do
      it 'nameが空白では登録できない' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it 'emailが空白では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it '重複したemailが存在する場合は保存できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
      end
      it 'emailは@を含まないと保存できない' do
        @user.email = 'testemail'
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールは不正な値です")
      end
      it 'passwordが空白では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは文字と数字の両方を含めてください")
      end
      it 'passwordが129文字以上では登録できない' do
        @user.password = Faker::Internet.password(min_length: 129)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは128文字以内で入力してください")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'passwordは数字のみだと登録できない' do
        @user.password = '111111'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは文字と数字の両方を含めてください")
      end
      it 'passwordはアルファベットのみだと登録できない' do
        @user.password = 'ssssss'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは文字と数字の両方を含めてください")
      end
      it 'passwordは全角文字を含むと登録できない' do
        @user.password = 'あいうえお'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは文字と数字の両方を含めてください")
      end
      it 'first_name_kanjiが空白では登録できない' do
        @user.first_name_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名字(全角)を入力してください")
      end
      it 'first_name_kanjiが半角文字では登録できない' do
        @user.first_name_kanji = 'First name'
        @user.valid?
        expect(@user.errors.full_messages).to include("名字(全角)は全角文字で入力してください")
      end
      it 'last_name_kanjiが空白では登録できない' do
        @user.last_name_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("氏名(全角)を入力してください")
      end
      it 'last_name_kanjiが半角文字では登録できない' do
        @user.last_name_kanji = 'last name'
        @user.valid?
        expect(@user.errors.full_messages).to include("氏名(全角)は全角文字で入力してください")
      end
      it 'first_name_kanaが空白では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名字(カナ)を入力してください")
      end
      it 'first_name_kanaがカナ文字以外では登録できない' do
        @user.first_name_kana = 'First name'
        @user.first_name_kana = '名字'
        @user.first_name_kana = 'みょうじ'
        @user.valid?
        expect(@user.errors.full_messages).to include("名字(カナ)はカタカナで入力してください")
      end
      it 'last_name_kanaが空白では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("氏名(カナ)を入力してください")
      end
      it 'last_name_kanaがカナ文字以外では登録できない' do
        @user.last_name_kana = 'last name'
        @user.last_name_kana = '名前'
        @user.last_name_kana = 'なまえ'
        @user.valid?
        expect(@user.errors.full_messages).to include("氏名(カナ)はカタカナで入力してください")
      end
      it 'birthdayが空白では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("生年月日を入力してください")
      end
    end
  end
end
