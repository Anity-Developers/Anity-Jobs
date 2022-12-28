require 'sidekiq-scheduler'

class JobTrackerScheduler
    def perform(job_id)
        job = Job.find_by(slug: job_id)
        job.increment_view
    end
end