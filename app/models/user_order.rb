class UserOrder
  include ActiveModel::Model
  attr_accessor :token,:user_id,:item_id,:post_code, :prefecture_id, :city, :house_number, :building_number, :tell #:token,:Item,:User,

  with_options presence: true do
    #validates :name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
    #validates :name_reading, format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters."}
    #validates :nickname, format: { with: /\A[a-z0-9]+\z/i, message: "is invalid. Input half-width characters."}
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"} # numericality: { other_than: 0 },
    #validates :price, numericality: { only_integer: true, message: "is invalid. Input half-width characters." }
  end
  validates :prefecture_id, numericality: { other_than: 0 , message: "Select"}
  #validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "can't be blank. Input full-width characters."} #numericality: { other_than: 0, message: "can't be blank" }
  #validates :price, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 1000000, message: "is out of setting range"}
  validates :tell, numericality: { other_than: 0, message: "can't be blank" }

  def save
    order = Order.create!(user_id: @user_id,item_id: item_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_number: building_number, tell: tell, order: order)
  end
end
