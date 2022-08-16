class User::GoodsController < ApplicationController
  def create
    @good = Good.new(user_id: current_user.id, car_post_id: params[:car_post_id])
    @good.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @good = Good.find_by(user_id: current_user.id, car_post_id: params[:car_post_id])
    @good.destroy
    redirect_back(fallback_location: root_path)
  end
end
