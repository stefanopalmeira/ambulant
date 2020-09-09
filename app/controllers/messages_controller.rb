class MessagesController < ApplicationController

  def create
    @message = Message.new(set_params)
    @message.chat = Chat.find(params[:chat_id])
    @message.user = current_user
    @chat = @message.chat
    authorize @message
    if @message.save
      ChatChannel.broadcast_to(
        @chat, render_to_string(partial: 'message', locals: {message: @message})
      )
    end
  end

  def mark_as_read
    @message = Message.find(params[:message_id])
    authorize @message
    @message.update(read: true)
  end

  private

  def set_params
    params.require(:message).permit(:content)
  end
end
