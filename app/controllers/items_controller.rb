class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new
  
  def index
  end
  
  def new
    # unless user_signed_in?
      # redirect_to new_user_session_path
    # end
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

  private

  def item_params
    params.require(:item).permit(:item_name, :image, :guid, :status_id, :costs_allocation_id, 
      :delivery_day_id, :price, :category_id, :prefecture_id).merge(user_id: current_user.id)
  end

end
