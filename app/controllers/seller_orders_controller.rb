class SellerOrdersController < ApplicationController
  before_action :check_seller
  
  def index
    @orders = policy_scope(Order, policy_scope_class: SellerOrdersPolicy::Scope)
  end

  def update
    authorize @order, policy_class: BuyerOrdersPolicy 
  end

  private

  def check_seller
    redirect_to buyer_orders_path unless current_user.seller
  end
end
