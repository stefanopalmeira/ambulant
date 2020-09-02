class OrderPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
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
