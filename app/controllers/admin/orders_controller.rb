class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_items = OrderItem.where(order_id: @order.id)
  end


  def update
    order = Order.find(params[:id])

    if order.update(order_params)
      redirect_to admin_order_path(order)

    else
      @order = Order.find(params[:id])
      @order_items = OrderItem.where(order_id: @order.id)

      render :show
    end

  end


  private

  def order_params
    params.require(:order).permit(:status)
  end

end
