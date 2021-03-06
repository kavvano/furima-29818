class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :links

  with_options presence: true do
    validates :nickname
    validates :password, format: { with: /\A(?=\d{0,254}+[a-z])(?=[a-z]{0,254}+\d)[a-z\d]{6,255}+\z/i, message: '半角英数のみが使えます' }
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: '全角ひらがな、カナ、漢字が使えます' }
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: '全角ひらがな、カナ、漢字が使えます' }
    validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: '全角カナのみが使えます' }
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: '全角カナのみが使えます' }
    validates :birthday
  end
end
