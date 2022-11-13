class DashboardPolicy < ApplicationPolicy
  def index?
    user.admin?
  end
end