class WelcomeController < ApplicationController
  skip_before_action :authenticate

  def index
    @evaluations = Evaluation.all.order(:created_at)
    render layout: "fullpage"

  end
end
