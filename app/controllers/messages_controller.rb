class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    message = Message.new(message_params)
    message.sender_id = current_user.id
    if message.save
      redirect_to user_path(message.receiver_id)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def index
    if params[:user_id].to_i != current_user.id
      redirect_to root_path
    end
      @messages = Message.where(receiver_id: current_user.id)
  end

  private

    def message_params
      params.require(:message).permit(:receiver_id, :body)
    end
end
