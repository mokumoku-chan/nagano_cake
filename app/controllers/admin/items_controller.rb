class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
    @genres = Genre.all
  end

  def new
    @item = Item.new

  end

  def create
    @item = Item.new(item_params)
    @item.created_at = Time.now
    @item.updated_at = Time.now


    if @item.save
      redirect_to admin_items_path

    else
      render :new

    end
  end


  private
  def item_params
    params.require(:item).permit(:genre_id, :name, :image, :introduction, :price, :is_active)
  end

end
