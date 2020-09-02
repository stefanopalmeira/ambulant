class SellerOrdersController < ApplicationController
  before_action :check_seller
  
  def index
    @orders = policy_scope(Order, policy_scope_class: SellerOrdersPolicy::Scope)
  end

  def create
    @order = Order.new
    @inventory = Inventory.find(params[:inventory_id])
    @order.inventory = @inventory
    @order.user = current_user
    @order.accepted = 1

    authorize @order
    if @order.save
      redirect_to buyer_order_path(@order)
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

  private

  def check_seller
    redirect_to buyer_orders_path unless current_user.seller
  end
end
