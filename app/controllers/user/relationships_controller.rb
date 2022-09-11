class User::RelationshipsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    current_user.follow(params[:user_id])
  end

  def destroy
    @user = User.find(params[:user_id])
    current_user.unfollow(params[:user_id])
  end

  def followings
    @user = User.find(params[:user_id])
    @users = @user.followings.page(params[:page]).per(10)
    redirect_to new_user_session_path unless user_signed_in?
  end

  def followers
    @user = User.find(params[:user_id])
    @users = @user.followers.page(params[:page]).per(10)
    redirect_to new_user_session_path unless user_signed_in?
  end
end
