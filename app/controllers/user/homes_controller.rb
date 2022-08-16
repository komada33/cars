class User::HomesController < ApplicationController
  def top
    @carposts = CarPost.all.limit(5).order(created_at: :desc)
  end

  def about
  end
end
