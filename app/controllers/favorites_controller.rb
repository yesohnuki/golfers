class FavoritesController < ApplicationController

  def create
    @golfcourse = Golfcourse.find(params[:golfcourse_id])
    favorite = current_user.favorites.new(golfcourse_id: @golfcourse.id)
    favorite.save
    # redirect_to golfcourse_path(golfcourse.id) #非同期通信化
  end

  def destroy
    @golfcourse = Golfcourse.find(params[:golfcourse_id])
    favorite = current_user.favorites.find_by(golfcourse_id: @golfcourse.id)
    favorite.destroy
    # redirect_to golfcourse_path(golfcourse.id) #非同期通信化
  end

end
