class TranslatePostJob
  include Sidekiq::Job

  def perform(job_id)
    # Do something
    puts "-"*20
    puts "TranslatePostJob"
    job = Job.find(job_id)
    # duplicate the job
    new_job = job.clone
    new_job.status = 'pending'
    if new_job.translation == 'en'
      new_job.title = "English Translation of #{job.title}"
    elsif new_job.translation == 'fr'
      new_job.title = "French Translation of #{job.title}"
    end
    puts '=='*20
    new_job.save!
  end
end
