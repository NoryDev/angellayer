class WelcomeController < ApplicationController
  skip_before_action :authenticate

  def index
    if founder_signed_in?
      redirect_to founder_profile_dashboard_path(current_founder)
    elsif investor_signed_in? && current_investor.investor_profile
      redirect_to investors_profile_path(current_investor.investor_profile)
    elsif investor_signed_in?
      redirect_to investors_profile_index_path
    else
      @evaluations = Evaluation.all.order(created_at: :desc).first(3)
      render "index", layout: "fullpage"
    end
  end

  def sign_up
    params = sign_up_params
    flash[:sign_email] = params[:email]

    if params[:is_investor] == "1"
      flash[:is_investor] = true
      investor = Investor.new(email: sign_up_params[:email], password: sign_up_params[:password], password_confirmation: sign_up_params[:password_confirmation])
      if investor.save
        sign_in_and_redirect investor
      else
        @alert = investor.errors.map{ |key, value| "#{key} #{value}" }.join(", ")
        redirect_to(root_path, alert: @alert)
      end
    elsif params[:is_investor] == "0"
      flash[:is_investor] = false
      founder = Founder.new(email: sign_up_params[:email], password: sign_up_params[:password], password_confirmation: sign_up_params[:password_confirmation])
      if founder.save
        sign_in_and_redirect founder
      else
        @alert = founder.errors.map{ |key, value| "#{key} #{value}" }.join(", ")
        redirect_to(root_path, alert: @alert)
      end
    else
      @alert = "You must be either a founder or an investor"
      redirect_to(root_path, alert: @alert)
    end

  end

  def log_in
    params = log_in_params
    flash[:log_email] = params[:email]
    investor = Investor.find_by_email(params[:email])
    founder = Founder.find_by_email(params[:email])

    if investor
      if investor.valid_password?(params[:password])
        sign_in_and_redirect investor
      else
        @alert = "invalid email or password"
        redirect_to(root_path, alert: @alert)
      end
    elsif founder
      if founder.valid_password?(params[:password])
        sign_in_and_redirect founder
      else
        @alert = "invalid email or password"
        redirect_to(root_path, alert: @alert)
      end
    else
      @alert = "invalid email or password"
      redirect_to(root_path, alert: @alert)
    end
  end

  def dashboard
    @evaluations = Evaluation.all.order(created_at: :desc).first(5)
    @founder = current_founder
    render 'dashboard', layout: 'dashboard-fullpage'
  end

  private



    # Only allow a trusted parameter "white list" through.
    def sign_up_params
      params.require(:resource).permit(:email, :password, :password_confirmation, :is_investor)
    end

    def log_in_params
      params.require(:resource).permit(:email, :password)
    end
end
