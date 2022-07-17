class JobsController < ApplicationController
  def index
    @jobs = Job.all
  end

  def new
    @job = Job.new
    authorize @job
  end

  def create
    @job = Job.create(job_params)
    @job.location_id = @job.company.location_id if job_params[:location_id].blank?
    if @job.save
      flash[:notice] = "Job created successfully."
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @job = Job.find(params[:id])
  end

  def search
    @jobs = Job.search(search_params[:keyword])
    @keywords = search_params[:keyword]
    if @jobs.blank?
      flash[:notice] = "There aren’t any jobs that match your search."
      redirect_to root_path
    else
    render :index
    end
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :company_id, :application_url, :status, :location_id, :category_id)
  end

  def search_params
    params.permit(:keyword, :page, :per_page, :status)
  end
end
