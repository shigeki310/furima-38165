class ItemsController < ApplicationController
  before_action :set_item, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, only: [:edit, :update, :destroy] 

  def index
    @items = Item.all.order(created_at: :desc)
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
  end

  def edit
    redirect_to root_path if current_user == @item.user && @item.order != nil
  end


  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
      redirect_to root_path
  end



  private

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless current_user == @item.user
  end

  def item_params
    params.require(:item).permit(:image,:title,:description,:price,:category_id,:item_status_id,:prefecture_id,:shipping_cost_id,:shipping_date_id).merge(user_id: current_user.id)
  end

end
