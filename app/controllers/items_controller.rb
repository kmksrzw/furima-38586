class ItemsController < ApplicationController
  def index
  end
  
  def new
    @item = Item.new
  end
  
  def create
    Item.create(item_params)
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :image, :guid, :status_id, :costs_allocation_id, :delivery_day_id, :price, :category_id, :prefecture_id).merge(user_id: current_user.id)
  end

end
