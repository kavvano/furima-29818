class Link < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :buy

  with_options presence: true do
    validates :user, :item
  end
end
