class DashboardController < ApplicationController
  include Pundit::Authorization
  before_action :require_login
  before_action :require_admin
  def index
    @jobs = current_user.jobs
    @top_categories = Category.joins(:jobs).group(:id).order("COUNT(jobs.id) DESC").limit(3)
    @top_locations = Location.joins(:jobs).group(:id).order("COUNT(jobs.id) DESC").limit(3)
    @unpublished_jobs = current_user.jobs.where(status: :pending)
  end

  def weekly
    @jobs_week = current_user.jobs.where("created_at > ?", 1.week.ago)
  end

  private

  def require_admin
    unless current_user.admin?
      flash[:alert] = "You must be an admin to access this page."
      redirect_to root_path
    end
  end
end
