class BuyerOrdersPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
    end
  end

  def show?
    user == record.user
  end

  def create?
    user == record.user
  end

  def destroy?
    user == record.user
  end

end
