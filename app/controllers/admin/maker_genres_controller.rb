class Admin::MakerGenresController < ApplicationController
  def index
    @maker = MakerGenre.new
    @makers = MakerGenre.all
      redirect_to root_path unless admin_signed_in?
  end

  def create
    @maker = MakerGenre.new(maker_genre_params)
    @maker.save
    redirect_to admin_maker_genres_path
  end

  def edit
    @maker = MakerGenre.find(params[:id])
      redirect_to root_path unless admin_signed_in?
  end

  def update
    @maker = MakerGenre.find(params[:id])
    @maker.update(maker_genre_params)
    redirect_to admin_maker_genres_path
  end

  private
  def maker_genre_params
    params.require(:maker_genre).permit(:mname)
  end
end
