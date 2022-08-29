class User::CommentsController < ApplicationController
  def create
    @carpost = CarPost.find(params[:car_post_id])
    @comment = @carpost.comments.build(comment_params)
    @comment.user_id = current_user.id
    if  @comment.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to car_post_path(@comment.car_post.id)
    else
      render 'edit'
    end
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def comment_params
    params.require(:comment).permit(:post_comment, :car_post_id, :user_id)
  end
end
