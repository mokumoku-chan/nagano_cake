class Admin::GenresController < ApplicationController
  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    @genre.created_at = Time.now
    @genre.updated_at = Time.now

    if @genre.save
      redirect_to admin_genres_path

    else
      @genres = Genre.all
      render :index
    end
  end


  def edit
    @genre = Genre.find([params[:id]])
  end


  def update
    genre = Genre.find(params[:id])
    genre.updated_at = Time.now

    if genre.update(genre_params)
      redirect_to admin_genres_path

    else
      render :edit

    end
  end


  private
  def genre_params
    params.require(:genre).permit(:name, :created_at, :updated_at)
  end

end
