class ApplicationController < ActionController::Base
  protect_from_forgery
  # force_ssl

  around_filter :user_time_zone, if: :current_user

  include Pundit
  #after_filter :verified_authorized, :except => :index

  # def ssl_enabled?
  #   !(Rails.env.development? || Rails.env.test?)
  # end

  # def https
  #   ssl_enabled? ? "https://" : "http://"
  # end
  # helper_method :https

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:error] = "You are not authorized to perform this action."
    redirect_to request.headers["Referer"] || root_path
  end

  def after_sign_out_path_for(resource_or_scope)
    request.referrer
  end

  def user_time_zone(&block)
    Time.use_zone(current_user.time_zone, &block)
  end
end
