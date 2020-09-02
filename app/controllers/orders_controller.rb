class OrdersController < ApplicationController


  def index
    @orders = policy_scope(Order)
  end


  def show
    @order = Order.find(params[:id])
    authorize @order
  end


  def create
    @order = Order.new
    @inventory = Inventory.find(params[:inventory_id])
    @order.inventory = @inventory
    @order.user = current_user
    @order.accepted = 1

    authorize @order
    if @order.save
      redirect_to order_path(@order)
    else
      render 'inventories/show'
    end
  end

  def destroy
    @order = Order.find(params[:id])
    authorize @order
    @order.destroy
    redirect_to root_path #adaptar rota
  end
end
