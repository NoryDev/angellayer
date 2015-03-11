class Founders::ProfileController < ApplicationController
  before_action :set_founder, only: [:show, :edit, :update]
  skip_before_action :founder_not_authorized
  skip_before_action :investor_not_authorized, except: [:edit, :update]

  def index
    @founders = Founder.all
  end

  def show
  end

  def edit
    if current_founder != @founder
      founder_not_authorized
    end
  end

  def update
    if current_founder != @founder
      founder_not_authorized
    else
      if @founder.update(founder_params)
        redirect_to founders_profile_path(@founder), notice: 'Your profile was successfully updated.'
      else
        render :edit
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_founder
      @founder = Founder.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def founder_params
      params.require(:founder).permit(:first_name, :last_name, :facebook, :twitter, :linkedin, :angellist, :skype, :cell_phone, :website, :all_startups, :profile_pic)
    end
end
