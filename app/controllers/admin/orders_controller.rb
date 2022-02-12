class Admin::OrdersController < ApplicationController

  before_action :authenticate_admin!

  def show
    @order = Order.find(params[:id])
    @order_items = OrderItem.where(order_id: @order.id)
  end


  def update
    order = Order.find(params[:id])

    order.update(order_params)

    if order.status == "confirm"
      order_items = OrderItem.where(order_id: order.id)

      order_items.each do |order_item|
        order_item.update(production_status: 1)
      end

    end

    redirect_to admin_order_path(order)
  end


  private

  def order_params
    params.require(:order).permit(:status)
  end

end
