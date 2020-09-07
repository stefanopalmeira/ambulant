class ChatPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    user == record.sender || user == record.recipient
  end

  def create?
    user == record.sender || user == record.recipient
  end
end
