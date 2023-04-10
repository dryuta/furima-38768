class OrdersController < ApplicationController
  def index
  end

  def create
    @order = Order.create(order_params)
    DeliverAddress.create(deliver_address_params)
    redirect_to root_path
  end

  private

  def order_params
    params.merge(user_id: current_user.id, item_id: params[:item_id])

  end

  def deliver_address_params
    params.permit(:zip_code, :prefecture_id, :city, :address, :building, :telephone).merge(order_id: @order.id)
  end
end
