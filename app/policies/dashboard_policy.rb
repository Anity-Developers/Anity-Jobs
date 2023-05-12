class DashboardPolicy < ApplicationPolicy
  def index?
    user.has_permission?(:index, :dashboard)
  end
end
