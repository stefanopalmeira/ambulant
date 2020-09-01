class OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    authorize @order
  end
  
  
  def create
    @order = Order.new
    @inventory = Inventory.find(params[:inventory_id])
    @order.inventory = @inventory
    @order.user = current_user
    authorize @order
    if @order.save
      redirect_to inventory_order_path(@inventory, @order)
    else
      render 'inventories/show'
    end
  end
end
