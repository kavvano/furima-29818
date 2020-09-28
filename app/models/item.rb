class Item < ApplicationRecord
  belongs_to :user
  has_one :link
  has_one_attached :image

  with_options presence: true do
    validates :title, length: { maximum: 40 }
    validates :explanation, length: { maximum: 1000 }
    validates :category_id, :status_id, :delivery_fee_id, :area_id, :days_id, numericality: { other_than: 1 }
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    validates :image, :user
  end
end
