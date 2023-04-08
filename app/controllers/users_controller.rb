class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @golfcourses = @user.golfcourses
  end

  def edit
  end
end
