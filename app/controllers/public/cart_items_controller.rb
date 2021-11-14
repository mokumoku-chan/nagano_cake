class Public::CartItemsController < ApplicationController
  def create
    cart_item = Cart_item.new(cart_item_params)

    cart_item.save
    redirect_to items_path
  end




  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :amount)
  end
end
