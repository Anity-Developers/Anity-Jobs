require 'sidekiq-scheduler'

class TrackerTimeScheduler
    include Sidekiq::Worker

    def perform(job_id)
        job = Job.find_by(slug: job_id)
        job.increment_view
    end
end