require 'sidekiq-scheduler'

class JobTrackerScheduler
    
    # binding.pry
    

    def perform(job_id)
        job = Job.find_by(id: job_id)
        job.increment_view
    end
end