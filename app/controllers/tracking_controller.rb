class TrackingController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def send_notification
    elapsed_time = params[:elapsedTime]
     p "========== You have been on this page for more than #{elapsed_time} seconds ======"
  end
end