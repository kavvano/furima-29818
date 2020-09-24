class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :links

  with_options presence: true do
    validates :nickname
    validates :password, format: { with: /\A[a-zA-Z0-9]+\z/, message: "半角英数のみが使えます"}, length: {minimum: 5}
    validates :last_name
    validates :first_name
    validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "全角カナのみが使えます"}
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "全角カナのみが使えます"}
    validates :birthday
  end
  
end