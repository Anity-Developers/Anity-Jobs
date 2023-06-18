class DeleteOldJobsWorker
  include Sidekiq::Worker

  def perform
    Job.where("created_at < ?", 1.month.ago).destroy_all
  end
end
