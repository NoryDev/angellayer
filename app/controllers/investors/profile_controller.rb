class Investors::ProfileController < ApplicationController

  before_action :set_profile, only: [:show, :edit, :update]

  skip_before_action :founder_not_authorized, except: [:edit, :update]
  skip_before_action :investor_not_authorized

  def index
    @profiles = fetch_profiles
    @profiles = @profiles.page(params[:page]).per(per_page)
    render "index", layout: "header-fullpage"
  end

  def show
  end

  def edit
    if current_investor != @profile.investor
      investor_not_authorized
    end
  end

  def update
    if current_investor && (current_investor != @profile.investor)
      investor_not_authorized
    else
      if @profile.update(profile_params)
        redirect_to investors_profile_path(@profile), notice: 'Your profile was successfully updated.'
      else
        render :edit
      end
    end
  end

  def new
    @profile = InvestorProfile.new
    if current_investor
      @profile.email = current_investor.email
    else

    end
  end

  def create
    @profile = InvestorProfile.new(profile_params)

    if current_investor && current_investor.investor_profile.nil?
      @profile.investor = current_investor
    end

    if current_founder
      @profile.author_as_founder = current_founder
      @profile.author_is_founder = true
    elsif current_investor
      @profile.author_as_investor = current_investor
      @profile.author_is_founder = false
    end

    if @profile.save
      redirect_to investors_profile_path(@profile), notice: "Profile for #{@profile.company_name} was successfully created."
    else
      render :new
    end
  end

  private

    # Method for sorting
    def fetch_profiles
      case params[:order]
      when "average_score"
        # order(total_average_score: :desc) with nil in the end, solution found on stackoverflow n° 5520628
        base_scope.order('coalesce(total_average_score, -1) desc')
      when "company_name"
        base_scope.order(company_name: :asc)
      when "nb_reviews"
        base_scope.joins(:evaluations).group("investor_profiles.id").order("count(evaluations.id) DESC")
      else
        base_scope.order(updated_at: :desc)
      end
    end

    # Method for sorting, loads the investors, founders, and comments for quicker action
    def base_scope
      # InvestorProfile.all
      InvestorProfile.all
    end

    # Number of profiles on a page
    def per_page
      25
    end


    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = InvestorProfile.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def profile_params
      params.require(:investor_profile).permit(:company_name, :email, :physical_address, :phone_number, :facebook, :twitter, :linkedin, :angellist, :skype, :cell_phone, :website, :contact_person, :contact_email, :contact_cell_phone, :sectors_invested_in, :capital_under_managment, :geographical_focus, :preferred_investment_stage, :nb_projects_invested_in, :profile_pic)
    end
end