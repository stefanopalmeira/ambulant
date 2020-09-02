class OrderPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.seller
        @orders = scope.joins(inventory: :selling_user).where(user: user)
      else
        false
      end
    end
  end

  def show?
    user == record.user
  end

  def create?
    user != record.inventory.selling_user
  end

  def destroy?
    user == record.user
  end
end
