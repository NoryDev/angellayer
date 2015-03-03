class Founders::ProfileController < ApplicationController
  before_action :set_founder, only: [:show, :edit, :update]

  def index
    @founders = Founder.all
  end

  def show
  end

  def edit
  end

  def update
    if @founder.update(founder_params)
      redirect_to founders_profile_path(@founder), notice: 'Your profile was successfully updated.'
    else
      render :edit
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_founder
      @founder = Founder.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def founder_params
      params.require(:founder).permit(:first_name, :last_name, :facebook, :twitter, :linkedin, :angellist, :skype, :cell_phone, :website, :all_startups)
    end
end