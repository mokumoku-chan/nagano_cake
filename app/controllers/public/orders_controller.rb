class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @order_item = OrderItem.new


    @customer = Customer.find(current_customer.id)

  end


  def confirm
    @cart_items = CartItem.where(customer_id: current_customer.id)
    @order_item = OrderItem.new

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
    @order = Order.new(order_params)
    @order.status = 0
    @order.customer_id = current_customer.id
    @order.save!

    cart_items = current_customer.cart_items
    cart_items.each do |cart_item|
      order_item = OrderItem.new
      order_item.item_id = cart_item.item.id
      order_item.order_id = @order.id
      order_item.amount = cart_item.amount

      item_price = cart_item.item.price * 1.1
      order_item.price = item_price.floor

      order_item.production_status = 0

      order_item.save
    end

    current_customer.cart_items.destroy_all
    redirect_to thanks_orders_path

  end

  def thanks
  end


  def index
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
    @order_items = OrderItem.where(order_id: @order.id)
  end


  private
    def order_params
      params.require(:order).permit(:payment_method, :postal_code, :name, :address, :payment, :postage, :status)
    end

end
