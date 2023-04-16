class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @golfcourses = @user.golfcourses.page(params[:page])
    @current_entry = Entry.where(user_id: current_user.id)
    @another_entry = Entry.where(user_id: @user.id)
    unless @user.id == current_user.id
      @current_entry.each do |current|
        @another_entry.each do |another|
          if current.room_id == another.room_id
            @is_room = true
            @room_id = current.room_id
          end
        end
      end
      unless @is_room
        @room = Room.new
        @entry = Entry.new
      end
    end
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
