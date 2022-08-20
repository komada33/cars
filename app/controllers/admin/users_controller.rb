class Admin::UsersController < ApplicationController
  def index
    @users = User.all.page(params[:page]).per(20)
      redirect_to root_path unless admin_signed_in?
  end

  def show
    @user = User.find(params[:id])
    @carposts = @user.car_posts.order(created_at: :desc).page(params[:page]).per(10)
      redirect_to new_user_session_path unless admin_signed_in?
  end

  def edit
    @user = User.find(params[:id])
      redirect_to root_path unless admin_signed_in?
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
      redirect_to admin_user_path(@user.id)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
      redirect_to admin_users_path
  end

  def withdrawl_false
    redirect_to root_path unless admin_signed_in?
    @user = User.find(params[:id])
    @user.update(is_deleted: false)
      redirect_to admin_user_path(@user.id)
  end

  def withdrawl_true
    redirect_to root_path unless admin_signed_in?
    @user = User.find(params[:id])
    @user.update(is_deleted: true)
      redirect_to admin_user_path(@user.id)
  end

  private
  def user_params
    params.require(:user).permit(:name, :car_name, :email, :is_deleted, :maker_genre_id, :plofile_image)
  end
end
