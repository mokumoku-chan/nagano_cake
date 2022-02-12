class Admin::ItemsController < ApplicationController


  before_action :authenticate_admin!




  def index
    @items = Item.page(params[:page]).search(params[:search])
  end

  def new
    @item = Item.new

  end

  def create
    @item = Item.new(item_params)
    @item.created_at = Time.now
    @item.updated_at = Time.now


    if @item.save
      redirect_to admin_item_path(@item)

    else
      render :new

    end
  end

  def show
    @item = Item.find(params[:id])
  end


  def edit
    @item = Item.find(params[:id])
  end


  def update
    item = Item.find(params[:id])
    item.updated_at = Time.now

    if item.update(item_params)
      redirect_to admin_item_path(item)

    else
      render :edit
    end

  end


  private
  def item_params
    params.require(:item).permit(:genre_id, :name, :image, :introduction, :price, :is_active)
  end

end
