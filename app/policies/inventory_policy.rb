class InventoryPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    !user.seller
  end

  def edit?
    user == record.selling_user
  end

  def update?
    user == record.selling_user
  end

  def new?
    user.seller
  end

  def create?
    user.seller
  end

  def destroy?
    user == record.selling_user
  end
end
