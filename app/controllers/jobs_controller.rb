class JobsController < ApplicationController
  before_action :require_login , except: [:index, :show, :search]

  def index
    @jobs = job_scope
    @jobs = @jobs.sort_by { |job| country_name(job) == user_location ? 0 : 1 }
  end

  def new
    @job = current_user.jobs.build
    @companies = Company.pluck(:name, :id).sort_by { |company| company[0] }
    @locations = Location.pluck(:name, :id).sort_by { |location| location[0] }
    @categories = Category.pluck(:name, :id).sort_by { |category| category[0] }
    authorize @job
  end

  def create
    @job = current_user.jobs.create(job_params)
    @job.location_id = @job.company.location_id if job_params[:location_id].blank?
    if @job.save
      flash[:notice] = "Job created successfully."
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @job = Job.friendly.find(params[:id])
  end

  def search
    @jobs = job_scope.search(search_params[:keyword])
    @keywords = search_params[:keyword]
    if @jobs.blank?
      flash[:alert] = t("flash.jobs.no_results")
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def job_scope
    Job.all.where(status: 1).includes(:company, :location, :category)
  end

  def country_name(job)
    job.location.name.split('').last(2).join('')
  end

  def user_location
    country = request.location.country || "cd"
    ISO3166::Country(country.to_s.downcase).emoji_flag
  end

  def job_params
    params.require(:job).permit(:title, :description, :company_id, :application_url, :status, :location_id, :category_id)
  end

  def search_params
    params.permit(:keyword, :page, :per_page, :status)
  end
end
