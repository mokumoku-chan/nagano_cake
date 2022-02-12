class Admin::OrderItemsController < ApplicationController

  before_action :authenticate_admin!

  def update
    order_item = OrderItem.find(params[:id])
    order = Order.find(order_item.order.id)

    order_item.update(order_item_params)


    if order_item.production_status == "maiking"
      order.update(status: 2)

    elsif OrderItem.where(order_id: order_item.order_id, production_status: "finish").count == OrderItem.where(order_id: order_item.order_id).count
      order.update(status: 3)

    end


    redirect_to admin_order_path(order_item.order_id)

  end

  private

  def order_item_params
    params.require(:order_item).permit(:production_status)
  end

end
