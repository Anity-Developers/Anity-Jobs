class AdminDashboardService
  attr_accessor :user
  def initialize(user)
    @user = user
  end

  def weekly_jobs
    user.jobs.where("created_at > ?", 1.week.ago)
  end

  def top_categories
    Category.joins(:jobs).group(:id).order("COUNT(jobs.id) DESC").limit(3)
  end

  def top_locations
    Location.joins(:jobs).group(:id).order("COUNT(jobs.id) DESC").limit(3)
  end

  def new_job
    job = Job.new
    companies = Company.pluck(:name, :id).sort_by { |company| company[0] }
    locations = Location.pluck(:name, :id).sort_by { |location| location[0] }
    categories = Category.pluck(:name, :id).sort_by { |category| category[0] }
    OpenStruct.new(job: job, companies: companies, locations: locations, categories: categories)
  end
end