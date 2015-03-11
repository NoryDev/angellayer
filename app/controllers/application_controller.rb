class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate
  before_action :founder_not_authorized
  before_action :investor_not_authorized

  def authenticate
    authenticate_founder! unless investor_signed_in?
  end

  def founder_not_authorized
    if current_founder && !current_founder.admin
      not_authorized
    end
  end

  def investor_not_authorized
    if current_investor
      not_authorized
    end
  end

  private
    def not_authorized
      flash[:alert] = "You are not authorized to perform this action."
      redirect_to(:back)

      rescue ActionController::RedirectBackError
        redirect_to root_path
    end
end
