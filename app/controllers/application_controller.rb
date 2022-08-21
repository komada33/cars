class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search
  before_action :set_search_user

  def set_search
    @search = CarPost.ransack(params[:q])
    @search_carposts = @search.result.page(params[:page]).per(5).order(created_at: :desc)
  end

  def set_search_user
    @user_search = User.ransack(params[:q])
    @search_users = @user_search.result.page(params[:page]).per(20).order(created_at: :desc)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name plofile_image car_name maker_genre_id])
  end
end
