class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :logs

  with_options presence: true do
    validates :name, length: { maximum: 40 }
    validates :password
    validates :first_name_kana
    validates :first_name
    validates :last_name_kana
    validates :last_name
    validates :birthday
  end
end