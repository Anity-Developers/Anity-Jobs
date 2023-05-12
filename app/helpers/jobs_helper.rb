module JobsHelper
  def new_job?(job)
    # check if @job was created in the last 10 days
    job.created_at > 10.days.ago
  end

  def format_date(job)
    job.created_at.strftime("%b %d")
  end

  def job_not_published?(job)
    current_user&.admin? && current_user&.jobs&.include?(job) && job.pending?
  end

  def job_status(job)
    if job.published?
      {
        status: "new",
        classes: "bg-amber-400"
      }
    elsif job.pending?
      {
        status: "Unpublished",
        classes: "bg-stone-400"
      }
    else
      job.closed?
      {
        status: "Closed",
        classes: "bg-rose-400"
      }
    end
  end
end
