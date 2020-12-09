class Order < ApplicationRecord
  belongs_to :item
  belongs_to :user
  has_one :address

  #attr_accessor :token,:post_code,:prefecture,:city,:house_number,:building_name,:tell
  #validates :price, presence: true
  #validates :token, presence: true
end
