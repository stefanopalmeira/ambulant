class SellerChatsPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: :recipient)
    end
  end
end
