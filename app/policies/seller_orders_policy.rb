class SellerOrdersPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.select('orders.*').joins(inventory: :selling_user).where(inventories: { selling_user: user })
    end
  end
end
