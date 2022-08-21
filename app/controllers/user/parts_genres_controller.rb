class User::PartsGenresController < ApplicationController
  def index
    @pgenres = PartsGenre.all
    redirect_to new_user_session_path unless user_signed_in?
  end

  def show
    @pgenre = PartsGenre.find(params[:id])
    @pgenres = @pgenre.car_posts
    redirect_to new_user_session_path unless user_signed_in?
  end

  private

  def parts_genre_params
    params.permit(:pname, :car_post_id)
  end
end
