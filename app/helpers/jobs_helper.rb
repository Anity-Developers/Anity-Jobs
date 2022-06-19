module JobsHelper

  def new_job?(job)
    # check if @job was created in the last 10 days
    job.created_at > 10.days.ago
  end

  def format_date(job)
    job.created_at.strftime("%b %d")
  end

end
