class LinkItem
  include ActiveModel::Model
  attr_accessor :post_num, :area_id, :city, :address, :building, :cell_num, :item_id, :user_id, :token

  with_options presence: true do
    validates :token
    validates :post_num, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :area_id, numericality: { other_than: 1 }
    validates :city
    validates :address
    validates :cell_num, format: { with: /\A\d{10,11}\z/ }
  end

  def save
    link = Link.create(user_id: user_id, item_id: item_id)
    Buy.create(post_num: post_num, area_id: area_id, city: city, address: address, building: building, cell_num: cell_num, link_id: link.id)
  end
end
