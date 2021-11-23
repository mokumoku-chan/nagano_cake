class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = Customer.find(current_customer.id)

  end


  def confirm
    @cart_items = CartItem.where(customer_id: current_customer.id)

    if params[:order][:select_address] == "0"
      @order = Order.new(order_params)
      @order.name = current_customer.full_customer_name
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.registered_address



    elsif params[:order][:select_address] == "1"
      @order = Order.new(order_params)
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.name = @address.name
      @order.address = @address.address


    else
      @order = Order.new(order_params)


    end


  end


  def create
    order = Order.new(order_params)

    binding.pry

  end

  def thanks
  end


  private
    def order_params
      params.require(:order).permit(:payment_method, :postal_code, :name, :address, :payment,
      :postage, :status)
    end

    def order_items_params
      params.require(:order_items).permit(:item_id, :amount, :price)
    end


end
