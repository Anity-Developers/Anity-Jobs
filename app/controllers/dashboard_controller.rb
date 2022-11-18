class DashboardController < ApplicationController
  before_action :require_login
  def index
    @jobs = current_user.jobs
    @top_categories = Category.joins(:jobs).group(:id).order("COUNT(jobs.id) DESC").limit(3)
    @top_locations = Location.joins(:jobs).group(:id).order("COUNT(jobs.id) DESC").limit(3)
  end
end