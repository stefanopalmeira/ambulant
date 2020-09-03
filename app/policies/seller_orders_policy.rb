class SellerOrdersPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve  
      scope.includes(inventory: :selling_user).where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day, inventories: { user_id: user.id }).order(created_at: :desc)
    end
  end

  def update?
    user == record.inventory.selling_user
  end
end
