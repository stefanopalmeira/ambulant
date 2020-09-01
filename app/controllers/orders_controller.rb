class OrdersController < ApplicationController

  def create
    @order = Order.new
    @inventory = Inventory.find(params[:inventory_id])
    @order.inventory = @inventory
    @order.user = current_user
    authorize @inventory
    if @inventory.save
      redirect_to inventory_order(@inventory, @order)
    else
      render 'inventories/show'
    end
  end
end
