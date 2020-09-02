class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def create?
    user == record.order.user
  end

  def new?
    user == record.order.user
  end

  def destroy?
    user == record.order.user
  end
end
