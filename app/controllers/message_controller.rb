class MessageController < ApplicationController
  def show
    @chat = Chat.find(params[:chat])

  end

  def create
    @message = Message.new(message_params)
    @message.user = current_user
    @message.chat = Chat.find(params[:message][:chat_id])
    @chat = @message.chat
    if @message.save
      redirect_to action: 'show', chat: params[:message][:chat_id]
    end
  end

  private
  def message_params
    params.require(:message).permit(:content, :chat_id)
  end
end
