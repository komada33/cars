class User::MakerGenresController < ApplicationController
  def index
    @mgenres = MakerGenre.all
    redirect_to new_user_session_path unless user_signed_in?
  end

  def show
    @mgenre = MakerGenre.find(params[:id])
    @mgenres = @mgenre.users
    redirect_to new_user_session_path unless user_signed_in?
  end

  private

  def maker_genre_params
    params.permit(:mname, :user_id)
  end
end
