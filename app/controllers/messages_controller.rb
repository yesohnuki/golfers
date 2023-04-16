class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:destroy]

  def create
    message = Message.new(message_params)
    message.user_id = current_user.id
    if message.save
      redirect_to room_path(message.room)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    room = @message.room
    @message.destroy
    redirect_to room_path(room)
  end

  private

  def message_params
    params.require(:message).permit(:room_id, :body)
  end

  def correct_user
    @message = current_user.messages.find_by(id: params[:id])
    redirect_to root_path unless @message
  end
end