class BuyerOrdersController < ApplicationController

  before_action :check_seller

  def show
    @order = Order.last
    authorize @order, policy_class: BuyerOrdersPolicy
    # seller = User.where(selling_inventory: {orders: Order.last })
    # [@order.inventory.selling_user]    
    # @markers = seller.geocoded.map do |seller|
    #   {
    #     lat: seller.lat,
    #     lng: seller.long,
    #     iconSize: [45, 45],
    #     url: seller_url(seller.id),
    #     image: seller.photo.attached? ? cl_image_path(seller.photo&.key) : helpers.asset_url('Logo_pointer.png')
    #   }
    # end
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
