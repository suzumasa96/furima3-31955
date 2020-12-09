class User < ApplicationRecord
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders

  with_options presence: true do
    validates :name, length: { maximum: 40 }
    validates :email, format: {with: /@.+/}
    validates :password, format: {with: /[a-z\d]{6,}/i}
    validates :first_name_kana, :last_name_kana, format: {with: /\A[ァ-ヶー－]+\z/ }
    validates :first_name, :last_name, format: {with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :birthday
  end
end