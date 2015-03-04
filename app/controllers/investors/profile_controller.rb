class Investors::ProfileController < ApplicationController
  before_action :set_investor, only: [:show, :edit, :update]

  def index
    @investors = Investor.all
  end

  def show
  end

  def edit
  end

  def update
    if @investor.update(investor_params)
      redirect_to investors_profile_path(@investor), notice: 'Your profile was successfully updated.'
    else
      render :edit
    end
  end

  #######################
  # move it later?

  # def new_by_founder
  #   @investor = Investor.new
  # end

  # def create_by_founder
  #   @investor = Investor.new(investor_params)
  #   @investor = Investor.find(params[:investor_id])

  #   if @investor.save
  #     redirect_to investors_profile_path(@investor), notice: 'New Investor successfully created.'
  #   else
  #     render :new
  #   end
  # end

  #
  #######################

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_investor
      @investor = Investor.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def investor_params
      params[:investor][:website].gsub!(/\Ahttps?:\/\//,"")
      params[:investor][:twitter].gsub!(/\Ahttps?:\/\//,"")
      params[:investor][:facebook].gsub!(/\Ahttps?:\/\//,"")
      params[:investor][:angellist].gsub!(/\Ahttps?:\/\//,"")
      params[:investor][:linkedin].gsub!(/\Ahttps?:\/\//,"")
      params.require(:investor).permit(:company_name, :physical_address, :phone_number, :facebook, :twitter, :linkedin, :angellist, :skype, :cell_phone, :website, :contact_person, :contact_email, :contact_cell_phone, :sectors_invested_in, :capital_under_managment, :geographical_focus, :preferred_investment_stage, :nb_projects_invested_in, :profile_pic)
    end
end