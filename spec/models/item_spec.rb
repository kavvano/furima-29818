require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '出品がうまく行くとき' do
      it 'imageとtitle、explanation、category_id、status_id、delivery_id、area_id、day_id、price、user_idが存在すれば出品できる' do
        expect(@item).to be_valid
      end
      it '商品名が40文字以内であれば出品できる' do
        @item.title = Faker::Lorem.characters(number: 40)
        expect(@item).to be_valid
      end
      it '商品説明が1000文字以内であれば出品できる' do
        @item.explanation = Faker::Lorem.characters(number: 1000)
        expect(@item).to be_valid
      end
      it 'category_idが2〜11であれば出品できる' do
        @item.category_id = 11
        expect(@item).to be_valid
      end
      it 'status_idが2〜7であれば出品できる' do
        @item.status_id = 7
        expect(@item).to be_valid
      end
      it 'delivery_fee_idが2〜3であれば出品できる' do
        @item.delivery_fee_id = 3
        expect(@item).to be_valid
      end
      it 'area_idが2〜48であれば出品できる' do
        @item.area_id = 48
        expect(@item).to be_valid
      end
      it 'day_idが2〜4であれば出品できる' do
        @item.day_id = 4
        expect(@item).to be_valid
      end
      it 'priceが300〜9999999であれば出品できる' do
        @item.price = 9_999_999
        expect(@item).to be_valid
      end
    end

    context '出品がうまくいかないとき' do
      it 'imageが空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'titleが空では出品できない' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it 'explanationが空では出品できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'category_idが1だと出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it 'status_idが1だと出品できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Status must be other than 1')
      end
      it 'delivery_fee_idが1だと出品できない' do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery fee must be other than 1')
      end
      it 'area_idが1だと出品できない' do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Area must be other than 1')
      end
      it 'day_idが1だと出品できない' do
        @item.day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Days must be other than 1')
      end
      it 'priceが300より小さいと出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it 'priceが9999999より大きいと出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      it 'priceが全角数字だと出品できない' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'priceが数字でないと出品できない' do
        @item.price = 'abcde'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'userが紐づいていないと出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
