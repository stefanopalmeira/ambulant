class ChatsController < ApplicationController

  def show
    @chat = Chat.find(params[:id])
    authorize @chat
    @message = Message.new
  end

  def create
    @chat = Chat.new()
    @order =  Order.find(params[:buyer_order_id])
    @chat.sender = @order.user
    @chat.recipient = @order.inventory.selling_user
    authorize @chat
    if @chat.save
      redirect_to chat_path(@chat)
    else
      render 'buyer_orders/show'
    end
  end
end
