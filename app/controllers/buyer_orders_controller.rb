class BuyerOrdersController < ApplicationController
  def index
    @orders = policy_scope(Order, policy_scope_class: BuyerOrdersPolicy::Scope)
  end
end
