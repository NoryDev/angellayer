class Investors::TeamMembersController < ApplicationController

  before_action :find_profile, only: [:new, :edit, :create]

  skip_before_action :founder_not_authorized, only: [:show, :new]
  skip_before_action :investor_not_authorized, only: [:show, :new]

  def show
    @team_member = TeamMember.find(params[:id])
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
  end

  def edit
  end

  def update
  end

  private

    def find_profile
      @profile = InvestorProfile.find(params[:profile_id])
    end
end
