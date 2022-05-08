class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def edit
  end

  def show
  end

  private
  def user_params
    params.require(:user).permit(:name, :car_name, :maker_genre_id, :email, :plofile_image, :is_deleted)
  end
end
