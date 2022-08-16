class User::UsersController < ApplicationController
  def index
    @users = User.all.page(params[:page]).per(10)
      redirect_to new_user_session_path unless user_signed_in?
  end

  def show
    @user = User.find(params[:id])
    @carposts = @user.car_posts.order(created_at: :desc).page(params[:page]).per(5)
      redirect_to new_user_session_path unless user_signed_in?
  end

  def edit
    @user = User.find(params[:id])
      redirect_to root_path unless current_user.id == @user.id
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def withdrawl
    @user = current_user
      redirect_to root_path unless current_user.id == @user.id
    @user.update(is_deleted: true)
      reset_session
      redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :car_name, :is_deleted, :maker_genre_id, :plofile_image)
  end
end
