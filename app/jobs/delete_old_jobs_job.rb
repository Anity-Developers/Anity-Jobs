class DeleteOldJobsJob < ApplicationJob
  queue_as :default

  def perform
    Job.where("created_at < ?", 3.months.ago).delete_all
  end
end
