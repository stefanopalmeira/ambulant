class MessagePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def mark_as_read?
    record.user != user && (record.chat.sender == user || record.chat.recipient == user)
  end


  def create?
    true
  end
end
