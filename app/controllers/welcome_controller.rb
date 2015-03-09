class WelcomeController < ApplicationController
  skip_before_action :authenticate

  def index
    @evaluations = Evaluation.order(:created_at).last(3).reverse
    render layout: "fullpage"
  end
end
