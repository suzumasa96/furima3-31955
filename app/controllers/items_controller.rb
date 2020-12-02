class ItemsController < ApplicationController
  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
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
  end

  private

  def item_params
    params.require(:item).permit(:image,:item_name, :introduction, :price, :category_id, :condition_id,:shipping_cost_id,:destination_id,:shipping_date_id).merge(user_id: current_user.id)
  end
end

