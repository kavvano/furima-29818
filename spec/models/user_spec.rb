require 'rails_helper'

RSpec.describe User, type: :model do



  describe 'ユーザー新規登録' do
    context "新規登録がうまく行くとき" do
      it "nicknameとemail、password、first_name、last_name、first_name_kana、last_name_kana、birthdayが存在すれば登録できる" do
      end
      it "passwordが6文字以上であれば登録できる" do
      end
      it "passwordが半角英数文字であれば登録できる" do
      end
      it "first_name_kanaが全角カナ文字であれば登録できる" do
      end
      it "last_name_kanaが全角カナ文字であれば登録できる" do
      end
    end

    context "新規登録がうまくいかないとき" do
      it "nicknameが空では登録できない" do
      end
      it "emailが空では登録できない" do
      end
      it "重複したemailが存在すると登録できない" do
      end
      it "emailに@が存在しないと登録できない" do
      end
      it "passwordが空では登録できない" do
      end
      it "passwordが5文字以下では登録できない" do
      end
      it "passwordが半角英数字混合でない場合、登録できない" do
      end
      it "first_nameが空では登録できない" do
      end
      it "last_nameが空では登録できない" do
      end
      it "first_name_kanaが空では登録できない" do
      end
      it "last_name_kanaが空では登録できない" do
      end
      it "birthdayが空では登録できない" do
      end
    end
  end
end
