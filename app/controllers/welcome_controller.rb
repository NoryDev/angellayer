class WelcomeController < ApplicationController
  skip_before_action :authenticate_founder!
  skip_before_action :authenticate_investor!


  def index
    render layout: "fullpage"
  end
end
