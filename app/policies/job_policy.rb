class JobPolicy < ApplicationPolicy
  def create?
    user.has_permission?(:create, :job)
  end

  def new?
    create?
  end
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
