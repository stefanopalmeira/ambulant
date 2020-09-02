class SellerOrdersController < ApplicationController
  before_action :check_seller
  
  def index
    @orders = policy_scope(Order, policy_scope_class: SellerOrdersPolicy::Scope)
  end

  def update
    @order = Order.find(params[:id])
    status = params[:accepted].to_i
    if status == 2
      @order.accepted = 2
      authorize @order, policy_class: SellerOrdersPolicy
      if @order.save
        redirect_to seller_orders_path
      end
    elsif status == 3
      @order.accepted = 3
      authorize @order, policy_class: SellerOrdersPolicy
      if @order.save
        redirect_to (seller_orders_path, anchor: "review-#{@order.id}"
      end
    end 
  end

  private

  def check_seller
    redirect_to root_path unless current_user.seller
  end
end
