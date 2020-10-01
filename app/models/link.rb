class Link < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :area

  belongs_to :user
  belongs_to :item
  has_one :buy

  with_options presence: true do
    validates :user, :item
  end
end
