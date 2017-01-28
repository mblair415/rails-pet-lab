class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_owner
    @current_owner ||= Owner.find(session[:owner_id]) if session[:owner_id]
  end
  helper_method :current_owner

  def authorize
    redirect_to '/login' unless current_owner
  end
end
