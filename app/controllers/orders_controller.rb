class OrdersController < ApplicationController
  before_action :authenticate_user!
  #before_action :unsigned_root
  before_action :item_find, only: [:index, :create]

  def index
    redirect_to root_path unless @item.present?
    @user_order = UserOrder.new
  end

  def create
    @user_order = UserOrder.new(order_params)
    if @user_order.valid?
      pay_item
      @user_order.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  #def unsigned_root
    #redirect_to root_path if current_user == @item_user
  #end

  def item_find
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:user_order).permit(:post_code, :prefecture_id, :city, :house_number, :building_number, :tell).merge(token: params[:token],user_id: current_user.id,item_id: @item.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: Item.find(params[:item_id]).price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
