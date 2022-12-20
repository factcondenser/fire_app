class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception # TODO: Why isn't this in Rails 7 by default?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
end
