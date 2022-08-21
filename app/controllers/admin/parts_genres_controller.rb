class Admin::PartsGenresController < ApplicationController
  def index
    @part = PartsGenre.new
    @parts = PartsGenre.all
    redirect_to root_path unless admin_signed_in?
  end

  def create
    @part = PartsGenre.new(parts_genre_params)
    @part.save
    redirect_to admin_parts_genres_path
  end

  def edit
    @part = PartsGenre.find(params[:id])
    redirect_to root_path unless admin_signed_in?
  end

  def update
    @part = PartsGenre.find(params[:id])
    @part.update(parts_genre_params)
    redirect_to admin_parts_genres_path
  end

  def destroy
    @part = PartsGenre.find(params[:id])
    @part.destroy
    redirect_to admin_parts_genres_path
  end

  private

  def parts_genre_params
    params.require(:parts_genre).permit(:pname)
  end
end
