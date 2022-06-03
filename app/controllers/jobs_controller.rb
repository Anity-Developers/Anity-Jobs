class JobsController < ApplicationController
  def index
    @jobs = Job.all.order(created_at: :desc)
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

  private

  def job_params
    params.require(:job).permit(:title, :description, :company_id, :application_url, :status, :location_id)
  end
end
