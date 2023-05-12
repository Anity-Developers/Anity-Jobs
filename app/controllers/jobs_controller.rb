class JobsController < ApplicationController
  before_action :require_login, only: [:new, :create]
  def index
    @page = page_params
    @keywords = search_params[:keyword]
    @jobs = @keywords.present? ? job_scope.search(@keywords) : list_jobs
    @pagy = pagy_countless(list_jobs)
    # @jobs = job_scope.search(@keywords) if @keywords.present?

    flash[:alert] = t("flash.jobs.no_results") if @keywords.present? && @jobs.empty?
    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end

  def show
    @job = Job.friendly.find(params[:id])
  end

  private

  def list_jobs
    if request_method == "get"
      job_scope.limit(page_params * 40)
    else
      job_scope.offset(page_params * 40).limit(40)
    end
  end

  def job_scope
    Job.all.where(status: 1)
  end

  def request_method
    request.method.downcase
  end

  def country_name(job)
    job.location.name[0...-2].chars.join("").downcase
  end

  def search_params
    params.permit(:keyword, :page, :per_page, :status)
  end

  def page_params
    (params[:page] || 1).to_i
  end
end
