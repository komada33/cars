class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_path(@post.id)
    else
      render 'new'
    end
  end

  def index
    @posts = Post.all
  end

  def edit
  end

  def show
    @post = Post.find(params[:id])
  end

  private
  def post_params
    params.require(:post).permit(:parts_genre_id, :user_id, :title, :message, :post_image)
  end
end
