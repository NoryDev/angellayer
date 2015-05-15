class Investors::TeamMembersController < ApplicationController

  before_action :find_profile, only: [:new, :edit, :create]
  before_action :set_team_member, only: [:show, :edit, :update]

  skip_before_action :founder_not_authorized, only: [:show, :new]
  skip_before_action :investor_not_authorized, only: [:show, :new]

  def show
  end

  def new

    if @profile.investor_id
      if current_investor && (current_investor.investor_profile != @profile)
        investor_not_authorized
      end
    elsif current_founder
      if current_founder != @profile.author_as_founder
        founder_not_authorized
      end
    elsif current_investor
      if current_investor != @profile.author_as_investor
        investor_not_authorized
      end
    end

    @team_member = TeamMember.new
    @team_member.investor_profile = @profile
  end

  def create
    @team_member = TeamMember.new(team_member_params)
    @team_member.investor_profile = @profile

    if @team_member.save
      redirect_to investors_profile_path(@profile), notice: 'Team member was successfully added.'
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  private

    def find_profile
      @profile = InvestorProfile.find(params[:profile_id])
    end

    def set_team_member
      @team_member = TeamMember.find(params[:id])
    end


    # Only allow a trusted parameter "white list" through.
    def team_member_params
      params.require(:team_member).permit(:first_name, :last_name, :email, :phone, :job_title, :speciality, :year_joined, :facebook, :twitter, :linkedin, :angellist, :skype)
    end
end
