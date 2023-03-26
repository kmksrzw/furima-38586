class OrdersController < ApplicationController
  
  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:post_code, :prefecture_id, :city, :house_number, :building_name, :tel).merge(user_id: current_user.id,
    item_id: params[:item_id])
  end

  def order_pay_params
    params.require(:order_address).merge(token:params[:token],item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    @item = Item.find(order_pay_params[:item_id])
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_pay_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

end
