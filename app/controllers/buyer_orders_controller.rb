class BuyerOrdersController < ApplicationController

  before_action :check_seller

  def show
    @order = Order.where(user_id: current_user).order(created_at: :desc).limit(1)
    authorize @order.first, policy_class: BuyerOrdersPolicy
    seller = User.includes(selling_inventory: :orders).where(id: Order.last.inventory.selling_user, orders: {user: current_user}) 
    @markers = seller.geocoded.map do |seller|
      {
        lat: seller.lat,
        lng: seller.long,
        iconSize: [45, 45],
        url: seller_path(seller.id),
        image: seller.photo.attached? ? helpers.asset_url('Logo_pointer.png') : helpers.asset_url('Logo_pointer.png')
      }
    end
  end

  def create
    @order = Order.new
    @inventory = Inventory.find(params[:inventory_id])
    @order.inventory = @inventory
    @order.user = current_user
    @order.accepted = 1
    authorize @order, policy_class: BuyerOrdersPolicy 
    if @order.save
      redirect_to buyer_order_path(@order)
    else
      render 'inventories/show'
    end
  end

  def destroy
    @order = Order.find(params[:id])
    authorize @order, policy_class: BuyerOrdersPolicy 
    @order.destroy
    redirect_to root_path #adaptar rota
  end


  private

  def check_seller
    redirect_to seller_orders_path if current_user.seller
  end
end
