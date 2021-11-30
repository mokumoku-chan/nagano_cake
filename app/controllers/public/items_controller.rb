class Public::ItemsController < ApplicationController


  def index

    @genres = Genre.all()
    genre_id = params[:genre_id]


    if  genre_id.nil?
      @items = Item.page(params[:page]).search(params[:search])
      @id = 0


    else
      @items = Item.page(params[:page]).where(genre_id: genre_id)
      @genre = Genre.find(genre_id)
      @id = 1
    end

  end


  def show
    @item = Item.find(params[:id])
    @new_item = CartItem.new
  end

end
