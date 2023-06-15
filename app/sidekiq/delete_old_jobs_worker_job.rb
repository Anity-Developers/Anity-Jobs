class DeleteOldJobsWorkerJob
  include Sidekiq::Job

  def perform(*args)
    # Do something
  end
end
