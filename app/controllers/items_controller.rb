class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  
  def index
    @items = Item.order("created_at")
  end
  
  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to  root_path
    else
      render :new
    end
  end

  def show
    set_item
  end

  def edit
    set_item
    if current_user.id != @item.user.id
      redirect_to root_path
    end
  end

  def update
    item = Item.find(params[:id])
    if item.update(item_params)  
      redirect_to item_path(item.id)
    else
      @item = item
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :image, :guid, :status_id, :costs_allocation_id, 
      :delivery_day_id, :price, :category_id, :prefecture_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
