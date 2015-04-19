class EvaluationsController < ApplicationController
  before_action :find_profile, only: [:new, :edit, :create]
  before_action :set_evaluation, only: [:show, :edit, :update, :destroy]

  skip_before_action :founder_not_authorized, except: [:destroy]
  skip_before_action :investor_not_authorized, only: [:index, :show]

  # GET /evaluations
  def index
    @evaluations = fetch_evaluations
    @evaluations = @evaluations.page(params[:page]).per(per_page)

    respond_to do |format|
      format.html
      format.js
    end
  end


  # GET /evaluations/1
  def show
    @evaluation = Evaluation.find(params[:id])
  end

  # GET /evaluations/new
  def new
    @evaluation = Evaluation.new
    @evaluation.investor_profile = @profile
    @evaluation.founder = current_founder
  end

  # GET /evaluations/1/edit
  def edit
    if (current_founder != @evaluation.founder) && (current_founder && !current_founder.admin)
      founder_not_authorized
    end
  end

  # POST /evaluations
  def create
    @evaluation = Evaluation.new(evaluation_params)
    @evaluation.investor_profile = @profile
    @evaluation.founder = current_founder

    if @evaluation.save
      redirect_to investors_profile_path(@profile), notice: 'Evaluation was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /evaluations/1
  def update
    if current_founder != @evaluation.founder && (current_founder && !current_founder.admin)
      founder_not_authorized
    else
      if @evaluation.update(evaluation_params)
        redirect_to @evaluation, notice: 'Evaluation was successfully updated.'
      else
        render :edit
      end
    end
  end

  # DELETE /evaluations/1
  def destroy
    @evaluation.destroy
    redirect_to evaluations_url, notice: 'Evaluation was successfully destroyed.'
  end

  private

  # Method for sorting
  def fetch_evaluations
    case params[:order]
    when "date"
      base_scope.order(created_at: :desc)
    when "title_review"
      base_scope.order(:title_review)
    when "average_score"
      # order(average_score: :desc) with nil in the end, solution found on stackoverflow n° 5520628
      base_scope.order('coalesce(average_score, -1) desc')
    when "company_name"
      base_scope.joins(:investor_profile).order("investor_profiles.company_name ASC")
    when "founder"
      base_scope.joins(:founder).order("founders.last_name ASC")
    else
      base_scope
    end
  end

  # Method for sorting, loads the investors, founders, and comments for quicker action
  def base_scope
    Evaluation.includes(:investor_profile, :founder, :comments)
  end

  # Number of evaluation on a page
  def per_page
    5
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_evaluation
      @evaluation = Evaluation.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def evaluation_params
      params.require(:evaluation).permit(:investor_id, :founder_id, :review, :rating_reputation, :rating_deal, :rating_pitch, :rating_competence, :rating_commitment, :amount_raised, :would_work_again, :title_review, :created_at)
    end

    def find_profile
      @profile = InvestorProfile.find(params[:investor_id])
    end

end
