class User::GoodsController < ApplicationController
  before_action :set_car_post

  def create
    @good = Good.new(user_id: current_user.id, car_post_id: @carpost.id)
    @good.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @good = Good.find_by(user_id: current_user.id, car_post_id: @carpost.id)
    @good.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def set_car_post
    @carpost = CarPost.find_by(id: params[:car_post_id])
  end
end
