class TeamMembersController < ApplicationController

  skip_before_action :founder_not_authorized, only: [:show]
  skip_before_action :investor_not_authorized, only: [:show]

  def show
    @team_member = TeamMember.find(params[:id])
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end
end
