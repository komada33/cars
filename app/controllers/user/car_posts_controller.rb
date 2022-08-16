class User::CarPostsController < ApplicationController
  def new
    @carpost = CarPost.new
    　redirect_to new_user_session_path unless user_signed_in?
  end

  def create
    @carpost = CarPost.new(car_post_params)
    @carpost.user_id = current_user.id
    if @carpost.save
      redirect_to car_post_path(@carpost.id)
    else
      render 'new'
    end
  end

  def index
    @carposts = CarPost.all.page(params[:page]).per(5).order(created_at: :desc)
      redirect_to new_user_session_path unless user_signed_in?
  end

  def show
    @carpost = CarPost.find(params[:id])
    @comments = @carpost.comments.order(created_at: :desc)
    @comment = Comment.new
    @good_count = Good.where(car_post_id: @carpost.id).count
    @comment_count = Comment.where(car_post_id: @carpost.id).count
      redirect_to new_user_session_path unless user_signed_in?
  end

  def edit
    @carpost = CarPost.find(params[:id])
  end

  def update
    @carpost = CarPost.find(params[:id])
    @carpost.update(car_post_params)
      redirect_to car_post_path(@carpost.id)
  end

  def destroy
    @carpost = CarPost.find(params[:id])
    @carpost.destroy
      redirect_to car_posts_path
  end

  private
  def car_post_params
    params.require(:car_post).permit(:title, :message, :user_id, :parts_genre_id, :comment_id, { car_images: [] })
  end
end
