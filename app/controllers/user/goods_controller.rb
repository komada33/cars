class User::GoodsController < ApplicationController
  before_action :set_car_post

  def create
    @good = Good.create(user_id: current_user.id, car_post_id: @carpost.id)
  end

  def destroy
    good = Good.find_by(user_id: current_user.id, car_post_id: @carpost.id)
    good.destroy
  end

  private

  def set_car_post
    @carpost = CarPost.find(params[:car_post_id])
  end
end
