class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @golfcourses = @user.golfcourses.page(params[:page])
    @message = Message.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(user.id) #ユーザーの詳細ページへのパス
  end

  def guest_sign_in #ゲストサインイン機能
    user = User.guest
    sign_in user
    redirect_to user_path(user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

end
