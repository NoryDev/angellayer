class Investors::TeamMembersController < ApplicationController

  before_action :find_profile, only: [:show, :new, :edit, :create, :update]
  before_action :set_team_member, only: [:show, :edit, :update, :destroy]

  skip_before_action :founder_not_authorized
  skip_before_action :investor_not_authorized

  before_action :check_authorisation, only: [:new, :edit]

  def show
  end

  def new
    @team_member = TeamMember.new
    @team_member.investor_profile = @profile
  end

  def create
    @team_member = TeamMember.new(team_member_params)
    @team_member.investor_profile = @profile

    if @team_member.save
      redirect_to investors_profile_team_member_path(@profile, @team_member), notice: 'Team member was successfully added.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @team_member.update(team_member_params)
      redirect_to investors_profile_team_member_path(@team_member.investor_profile, @team_member), notice: 'Team Member was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @profile = @team_member.investor_profile

    if @profile.investor_id
      if current_investor && (current_investor.investor_profile != @profile)
        investor_not_authorized
      else
        destroy_it(@team_member, @profile)
      end
    else
      if current_founder
        if current_founder != @profile.author_as_founder
          founder_not_authorized
        else
          destroy_it(@team_member, @profile)
        end
      elsif current_investor
        if current_investor != @profile.author_as_investor
          investor_not_authorized
        else
          destroy_it(@team_member, @profile)
        end
      end
    end

  end

  private

    def destroy_it(team_member, profile)
      team_member.destroy
      redirect_to investors_profile_path(profile), notice: 'Team member was successfully deleted.'
    end

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

    def check_authorisation

      if @profile.investor_id
        if current_investor && (current_investor.investor_profile != @profile)
          investor_not_authorized
        end
      else
        if current_founder
          if current_founder != @profile.author_as_founder
            founder_not_authorized
          end
        elsif current_investor
          if current_investor != @profile.author_as_investor
            investor_not_authorized
          end
        end
      end

    end
end
