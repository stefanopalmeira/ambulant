class SellerChatsController < ApplicationController

  def index
    @chats = policy_scope(Chat, policy_scope_class: SellerChatsPolicy::Scope)
  end

end
