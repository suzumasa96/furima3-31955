class Item < ApplicationRecord
  belongs_to :user
  has_one    :log
  has_one_attached :image

  def was_attached?
    self.image.attached?
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_cost
  belongs_to :destination
  belongs_to :shipping_date

  with_options presence: true do
    validates :item_name
    validates :introduction
    validates :image
    validates :price, numericality: { greater_than: 299, less_than:9999999 }, format: {with: /\d/}
  end

  validates :category_id, :condition_id, :shipping_cost_id,:destination_id,:shipping_date_id, numericality: { other_than: 1}
  #user foreign_key: true
  #price
end
