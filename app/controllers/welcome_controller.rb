class WelcomeController < ApplicationController
  skip_before_action :authenticate

  def index
    if founder_signed_in? || investor_signed_in?
      dashboard
    else
      @evaluations = Evaluation.all.order(created_at: :desc).first(3)
      render "index", layout: "fullpage"
    end
  end

  def sign_up
    params = sign_up_params

    if params[:is_investor] == "1"
      if sign_up_params[:password] == sign_up_params[:password_confirmation]
        investor = Investor.new(email: sign_up_params[:email], password: sign_up_params[:password], password_confirmation: sign_up_params[:password_confirmation])
        investor.save
        sign_in_and_redirect investor
      else
        index
      end
    elsif params[:is_investor] == "0"
      if sign_up_params[:password] == sign_up_params[:password_confirmation]
        founder = Founder.new(email: sign_up_params[:email], password: sign_up_params[:password], password_confirmation: sign_up_params[:password_confirmation])
        founder.save
        sign_in_and_redirect founder
      else
        index
      end
    else
      index
    end

  end

  def log_in
    params = log_in_params
    investor = Investor.find_by_email(params[:email])
    founder = Founder.find_by_email(params[:email])

    if investor
      if investor.valid_password?(params[:password])
        sign_in_and_redirect investor
      else
        index
      end
    elsif founder
      if founder.valid_password?(params[:password])
        sign_in_and_redirect founder
      else
        index
      end
    else
      index
    end
  end

  private

    def dashboard
      @evaluations = Evaluation.all.order(created_at: :desc)
      render "evaluations/index"
    end

    # Only allow a trusted parameter "white list" through.
    def sign_up_params
      params.require(:resource).permit(:email, :password, :password_confirmation, :is_investor)
    end

    def log_in_params
      params.require(:resource).permit(:email, :password)
    end
end
