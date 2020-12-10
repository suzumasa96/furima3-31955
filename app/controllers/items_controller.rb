class ItemsController < ApplicationController
  before_action :authenticate_user!,except: [:index, :show]
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  #before_action :order_root, only: [:show]

  def index
    @items = Item.all.order("created_at DESC")
    @order = Order.all #exists?(item_id: params[:item_id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @order = Order.new(params[:item_id])
  end

  def edit
    redirect_to root_path unless current_user.id == @item.user_id
  end

  def update
    if @item.update(item_params)
      redirect_to item_path,method: :get
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @item.user_id
      redirect_to root_path if @item.destroy
    end
  end

  private

  #def order_root
    #redirect_to root_path if Order.exists?(item_id: params[:item_id])
  #end

  def item_params
    params.require(:item).permit(:image,:item_name, :introduction, :price, :category_id, :condition_id,:shipping_cost_id,:destination_id,:shipping_date_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end

