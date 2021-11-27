class Public::ItemsController < ApplicationController

  def index
    @items = Item.page(params[:page]).search(params[:search])
    @genres = Genre.all()
  end


  def show
    @item = Item.find(params[:id])
    @new_item = CartItem.new
  end

end
