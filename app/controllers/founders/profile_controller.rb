class Founders::ProfileController < ApplicationController
  before_action :set_founder, only: [:show, :edit, :update]
  skip_before_action :founder_not_authorized
  skip_before_action :investor_not_authorized, except: [:edit, :update]

  def index
    @founders = fetch_founders
  end

  def show
  end

  def edit
    if current_founder != @founder && (current_founder && !current_founder.admin)
      founder_not_authorized
    end
  end

  def update
    if current_founder != @founder && (current_founder && !current_founder.admin)
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

    # Method for sorting
    def fetch_founders
      case params[:order]
      when "last_name"
        base_scope.order(last_name: :asc)
      when "nb_reviews"
        base_scope.joins(:evaluations).group("founders.id").order("count(evaluations.id) DESC")
      when "nb_comments"
        base_scope.joins(:comments).group("founders.id").order("count(comments.id) DESC")
      else
        base_scope
      end
    end

    # Method for sorting, loads the investors, founders, and comments for quicker action
    def base_scope
      Founder.all
    end

    # Number of evaluation on a page
    def per_page
      5
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_founder
      @founder = Founder.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def founder_params
      params.require(:founder).permit(:first_name, :last_name, :facebook, :twitter, :linkedin, :angellist, :skype, :cell_phone, :website, :all_startups, :profile_pic)
    end
end
