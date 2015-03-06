class EvaluationsController < ApplicationController

  before_action :find_profile, only: [:new, :edit, :create]
  before_action :set_evaluation, only: [:show, :edit, :update, :destroy]

  # GET /evaluations
  def index
    if(params[:order]) == "title_review"
      @evaluations = Evaluation.all.order(:title_review)
    elsif (params[:order]) == "average_score"
      @evaluations = Evaluation.all.order(:title_review)
    else
      @evaluations = Evaluation.all
    end
  end

  # GET /evaluations/1
  def show
  end

  # GET /evaluations/new
  def new
    @evaluation = Evaluation.new
    @evaluation.investor_profile = @profile
    @evaluation.founder = current_founder
  end

  # GET /evaluations/1/edit
  def edit
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
    if @evaluation.update(evaluation_params)
      redirect_to @evaluation, notice: 'Evaluation was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /evaluations/1
  def destroy
    @evaluation.destroy
    redirect_to evaluations_url, notice: 'Evaluation was successfully destroyed.'
  end

  private
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
