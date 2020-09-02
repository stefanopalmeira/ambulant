class SellerOrdersController < ApplicationController
  def index
    @orders = policy_scope(Order, policy_scope_class: SellerOrdersPolicy::Scope)
  end
end
