class MakerGenresController < ApplicationController
  def index
    @maker = MakerGenre.new
    @makers = MakerGenre.all
  end

  def create
    @maker = MakerGenre.new(maker_genre_params)
    @maker.save
    redirect_to maker_genres_path
  end

  def edit
    @maker = MakerGenre.find(params[:id])
  end

  def update
    @maker = MakerGenre.find(params[:id])
    @maker.update(maker_genre_params)
    redirect_to maker_genres_path
  end

  private
  def maker_genre_params
    params.require(:maker_genre).permit(:maker)
  end
end
