class ProductPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def edit?
    user == record.inventory.selling_user
  end

  def update?
    user == record.inventory.selling_user
  end

  def new?
    user == record.inventory.selling_user
  end

  def create?
    user == record.inventory.selling_user
  end

  def destroy?
    user == record.inventory.selling_user
  end
end
