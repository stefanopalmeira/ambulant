class Message < ApplicationRecord
  belongs_to :chat

  def new
    @chat = Chat.find(params[:chat_id])
    @message = Message.new
  end

  def create
    @message
  end
end
