class ApplicationController < ActionController::Base
  include Clearance::Controller
  include Pundit::Authorization
  before_action :se_locale

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_back(fallback_location: root_path)
  end

  def se_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
end
