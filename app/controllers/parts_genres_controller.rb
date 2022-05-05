class PartsGenresController < ApplicationController
  def index
    @part = PartsGenre.new
    @parts = PartsGenre.all
  end

  def create
    @part = PartsGenre.new(parts_genre_params)
    @part.save
    redirect_to parts_genres_path
  end

  def edit
    @part = PartsGenre.find(params[:id])
  end

  def update
    @part = PartsGenre.find(params[:id])
    @part.update(parts_genre_params)
    redirect_to parts_genres_path
  end

  private
  def parts_genre_params
    params.require(:parts_genre).permit(:parts)
  end
end
