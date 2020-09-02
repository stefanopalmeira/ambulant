class BuyerOrdersController < ApplicationController

  before_action :check_seller

  def index
    @orders = policy_scope(Order, policy_scope_class: BuyerOrdersPolicy::Scope)
  end

  private

  def check_seller
    redirect_to seller_orders_path if current_user.seller
  end
end
