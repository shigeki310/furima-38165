class ItemsController < ApplicationController
  before_action :authenticate_user!, expect: :index

  def index
    @items = Item.all
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

  private

  def item_params
    params.require(:item).permit(:image,:title,:description,:price,:category_id,:item_status_id,:prefecture_id,:shipping_cost_id,:shipping_date_id).merge(user_id: current_user.id)
  end
end
