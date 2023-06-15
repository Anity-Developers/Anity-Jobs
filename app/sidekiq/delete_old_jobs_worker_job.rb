class DeleteOldJobsWorkerJob
  include Sidekiq::Job

  def perform(*args)
    Job.where("created_at < ?", 1.month.ago).destroy_all
  end
end
