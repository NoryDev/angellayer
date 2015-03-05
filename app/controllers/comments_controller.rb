class CommentsController < ApplicationController

  before_action :find_evaluation
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  #before_action :current_founder?

  # GET /comments
  def index
    @comments = @evaluation.comments
    @comment = Comment.new
  end

  # GET /comments/1
  def show
    @evaluation.comments(@comment)
  end


  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  def create
    @comment = @evaluation.comments.build(comment_params)
    @comment.founder = current_founder
    if @comment.save
      redirect_to investors_profile_path(@evaluation.investor_profile), notice: 'Your comment was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /comments/1
  def update
    @comment.founder = current_founder
    if @comment.update(comment_params)
      redirect_to investors_profile_path(@evaluation.investor_profile), notice: 'Your comment was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /comments/1
  def destroy
    @comment.destroy
    redirect_to evaluation_comments_path(@evaluation), notice: 'Your comment was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = @evaluation.comments.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def comment_params
      params.require(:comment).permit(:content, :evaluation_id, :founder_id)
    end

    def find_evaluation
      @evaluation = Evaluation.find(params[:evaluation_id])
    end

    # def current_founder?
    #   if current_founder != @evaluation.founder
    #     not_found
    #   end
    # end
end


