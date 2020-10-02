class Buy < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :area

  belongs_to :link

  with_options presence: true do
    validates :post_num, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :area_id, numericality: { other_than: 1 }
    validates :city, { with: /\A[ぁ-んァ-ン一-龥]/, message: '全角ひらがな、カナ、漢字が使えます' }
    validates :address, { with: /\A[ぁ-んァ-ン一-龥]/, message: '全角ひらがな、カナ、漢字が使えます' }
    validates :cell_num, length: { is: 11 }
    validates :link
  end
end
