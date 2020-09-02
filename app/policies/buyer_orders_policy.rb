class BuyerOrdersPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.select('orders.*').where(orders: { user: user })
    end
  end
end
