class CompanyPolicy < ApplicationPolicy

  def index?
    user.has_permission?(:index, :company)
  end

  def show?
    user.has_permission?(:show, :company)
  end

  def create?
    user.has_permission?(:create, :company)
  end

  def new?
    create?
  end

  def update?
    user.has_permission?(:update, :company)
  end

  def edit?
    update?
  end

  def destroy?
    user.has_permission?(:destroy, :company)
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
