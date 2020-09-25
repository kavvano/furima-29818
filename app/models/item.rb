class Item < ApplicationRecord
  belongs_to :user
  has_one :link
  has_one_attached :image

  with_options presence: true do
    validates :title, length: { maximum: 40 }
    validates :explanation, length: { maximum: 1000 }
    validates :category, :status, :delivery_fee, :area, :days, :user
    validates :price, length: { in: 300..9999999}
  end
  validates :category_id, :status_id, :delivery_fee_id, :area_id, :days_id, numericality: { other_than: 1 }

end
