class TrackingController < JobsController
  skip_before_action :verify_authenticity_token

  def send_notification
    scheduler = TrackerTimeScheduler.new
    scheduler.perform(params[:job_id])
  end
end
