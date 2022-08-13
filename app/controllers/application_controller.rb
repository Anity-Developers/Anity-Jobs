class ApplicationController < ActionController::Base
  include Clearance::Controller
  include Pundit::Authorization
  include ApplicationHelper
  before_action :set_locale

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = t("flash.pundit.unauthorized")
    redirect_back(fallback_location: root_path)
  end

  def set_locale
    locale = country_to_language(request.location.country.to_s.downcase)
    # puts "===========the locale is #{locale}==========="
    # puts "===========the locale is #{I18n.available_locales.include?(locale.to_sym)}==========="
    # locale = :fr
    I18n.locale = I18n.available_locales.include?(locale.to_sym) ?
        locale :
        I18n.default_locale
  end
end
