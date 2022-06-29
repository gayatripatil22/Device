class PostPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.role.role == 'admin'
        scope.all
      else
        scope.where.not(content: "")
      end
    end
  end
  def index?
    false
  end
  def create?
    return true if user.present? && user.role.role == 'admin'
  end
  def destroy?
    return true if user.present? && user.role.role == 'admin'
  end
end
