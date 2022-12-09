module Dashboard
  class JobsController < DashboardController
    def new
      @admin = AdminDashboardService.new(current_user).new_job
      @job = current_user.jobs.build
    end

    def create
      @job = current_user.jobs.create(job_params)
      @job.location_id = current_user.company.location_id if job_params[:location_id].blank?
      if @job.save
        flash[:notice] = "Job created successfully."
        redirect_to dashboard_path
      else
        render :new
      end
    end

    private

    def job_params
      params.require(:job).permit(:title, :description, :company_id, :application_url, :status, :location_id, :category_id)
    end
  end
end