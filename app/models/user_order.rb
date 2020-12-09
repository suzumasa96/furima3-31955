class UserOrder
  include ActiveModel::Model
  attr_accessor :token,:user_id,:item_id,:post_code, :prefecture_id, :city, :house_number, :building_number, :tell

  with_options presence: true do
    validates :token
    validates :user_id
    validates :item_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :house_number

  end
  validates :prefecture_id, numericality: { other_than: 0 , message: "Select"}
  validates :tell, numericality: { other_than: 0 , message: "can't be blank" }
  validates :tell, numericality: {less_than: 99999999999, message: "at least 11 digit"}
  def save
    order = Order.create!(user_id: @user_id,item_id: item_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_number: building_number, tell: tell, order: order)
  end
end
