class SellerOrdersPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.select('orders.*').joins(inventory: :selling_user).where(inventories: { selling_user: user }).order(created_at: :asc)
    end
  end

  def update?
    user == record.inventory.selling_user
  end
end
