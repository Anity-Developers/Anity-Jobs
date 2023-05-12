class JobPolicy < ApplicationPolicy
  def create?
    user.has_permission?(:create, :job)
  end

  def show?
    user.has_permission?(:show, :job)
  end

  def new?
    create?
  end

  def update?
    user.has_permission?(:update, :job)
  end

  def edit?
    update?
  end

  def destroy?
    user.has_permission?(:destroy, :job)
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
