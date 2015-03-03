class WelcomeController < ApplicationController
  skip_before_action :authenticate

  def index
    render layout: "fullpage"
  end
end
