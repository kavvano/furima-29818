require 'rails_helper'

RSpec.describe LinkItem, type: :model do
  before do
    @link_item = FactoryBot.build(:link_item)
  end

  describe '商品購入' do
    context '購入がうまく行くとき' do
      it 'tokenとpost_num、area_id、city、address、cell_numが存在すれば購入できる' do
        expect(@link_item).to be_valid
      end
      it '郵便番号が123-4567の形式であれば購入できる' do
        @link_item.post_num = '987-6543'
        expect(@link_item).to be_valid
      end
      it 'area_idが2〜48であれば購入できる' do
        @link_item.area_id = 48
        expect(@link_item).to be_valid
      end
      it 'buildingが空でも購入できる' do
        @link_item.building = ''
        expect(@link_item).to be_valid
      end
      it '電話番号が10桁もしくは11桁の数字の文字列であれば購入できる' do
        @link_item.cell_num = Faker::PhoneNumber.subscriber_number(length: 10)
        expect(@link_item).to be_valid
      end
    end

    context '購入がうまくいかないとき' do
      it 'tokenが空では購入できない' do
        @link_item.token = ''
        @link_item.valid?
        expect(@link_item.errors.full_messages).to include("Token can't be blank")
      end
      it 'post_numが空だと購入できない' do
        @link_item.post_num = ''
        @link_item.valid?
        expect(@link_item.errors.full_messages).to include("Post num can't be blank")
      end
      it 'post_numが7桁でも-（ハイフン）がないと購入できない' do
        @link_item.post_num = '1234567'
        @link_item.valid?
        expect(@link_item.errors.full_messages).to include('Post num is invalid')
      end
      it 'post_numが-（ハイフン）が含まれていても3桁4桁の組み合わせでないと購入できない' do
        @link_item.post_num = '1234-567'
        @link_item.valid?
        expect(@link_item.errors.full_messages).to include('Post num is invalid')
      end
      it 'area_idが1だと購入できない' do
        @link_item.area_id = 1
        @link_item.valid?
        expect(@link_item.errors.full_messages).to include('Area must be other than 1')
      end
      it 'cityが空だと購入できない' do
        @link_item.city = ''
        @link_item.valid?
        expect(@link_item.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空だと購入できない' do
        @link_item.address = ''
        @link_item.valid?
        expect(@link_item.errors.full_messages).to include("Address can't be blank")
      end
      it 'cell_numが空だと購入できない' do
        @link_item.cell_num = ''
        @link_item.valid?
        expect(@link_item.errors.full_messages).to include("Cell num can't be blank")
      end
      it 'cell_numが9桁以下だと購入できない' do
        @link_item.cell_num = '123456789'
        @link_item.valid?
        expect(@link_item.errors.full_messages).to include('Cell num is invalid')
      end
      it 'cell_numが12桁以上だと購入できない' do
        @link_item.cell_num = '123456789012'
        @link_item.valid?
        expect(@link_item.errors.full_messages).to include('Cell num is invalid')
      end
    end
  end
end
