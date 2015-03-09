class WelcomeController < ApplicationController
  skip_before_action :authenticate

  def index
    if founder_signed_in? || investor_signed_in?
      dashboard
    else
      @evaluations = Evaluation.order(:created_at).last(3).reverse
      render layout: "fullpage"
    end
  end

  def sign_up
  end

  def log_in
  end

  private

  def dashboard
    @evaluations = Evaluation.all.order(created_at: :desc)
    render "evaluations/index"
  end
end
