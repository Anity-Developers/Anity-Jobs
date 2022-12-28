class TrackingController < JobsController
  skip_before_action :verify_authenticity_token
  
  def send_notification
    binding.pry
    job_id = params[:id]
    elapsed_time = params[:elapsedTime]
     p "========== You have been on this page for more than #{elapsed_time} seconds ======"
     p "=========== here is the #{job_id} ========  "
    #  if elapsed_time
    #  scheduler = JobTrackerScheduler.new
    #  scheduler.perform()
    #  end
  end
end