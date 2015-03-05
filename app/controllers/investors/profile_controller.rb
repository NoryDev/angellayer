class Investors::ProfileController < ApplicationController

  before_action :set_profile, only: [:show, :edit, :update]

  def index
    @profiles = InvestorProfile.all
  end

  def show
  end

  def edit
  end

  def update
    if @profile.update(profile_params)
      redirect_to investors_profile_path(@profile), notice: 'Your profile was successfully updated.'
    else
      render :edit
    end
  end

  def new
    @profile = InvestorProfile.new
  end

  def create
    @profile = InvestorProfile.new(profile_params)

    if @profile.save
      redirect_to investors_profile_path(@profile), notice: "Profile for #{@profile.company_name} was successfully created."
    else
      render :new
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = InvestorProfile.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def profile_params
      params[:investor_profile][:website].gsub!(/\Ahttps?:\/\//,"")
      params[:investor_profile][:twitter].gsub!(/\Ahttps?:\/\//,"")
      params[:investor_profile][:facebook].gsub!(/\Ahttps?:\/\//,"")
      params[:investor_profile][:angellist].gsub!(/\Ahttps?:\/\//,"")
      params[:investor_profile][:linkedin].gsub!(/\Ahttps?:\/\//,"")
      params.require(:investor_profile).permit(:company_name, :email, :physical_address, :phone_number, :facebook, :twitter, :linkedin, :angellist, :skype, :cell_phone, :website, :contact_person, :contact_email, :contact_cell_phone, :sectors_invested_in, :capital_under_managment, :geographical_focus, :preferred_investment_stage, :nb_projects_invested_in, :profile_pic)
    end
end