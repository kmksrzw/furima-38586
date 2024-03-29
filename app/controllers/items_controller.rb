class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  
  def index
    @items = Item.order(created_at: :desc)
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
  end

  def edit
    if current_user.id != @item.user.id || @item.order.present?
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)  
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @item.user.id
      @item.destroy
    end
    redirect_to root_path
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
