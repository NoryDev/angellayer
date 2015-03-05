class CommentsController < ApplicationController
  before_action :find_review
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :current_founder?

  # GET /comments
  def index
    @comments = @review.comments
    @comment = Comment.new
  end

  # GET /comments/1
  def show
    @review.comments(@comment)
  en

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  def create
    @comment = @review.comments.build(comment_params)

    if @comment.save
      redirect_to review_comments_path(@review), notice: 'Your comment was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /comments/1
  def update
    if @comment.update(comment_params)
      redirect_to review_comments_path(@review), notice: 'Your comment was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /comments/1
  def destroy
    @comment.destroy
    redirect_to review_comments_path(@review), notice: 'Your comment was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = @review.comments.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def comment_params
      params.require(:comment).permit(:content, :review_id, :founder_id)
    end

    def find_review
      @review = Flat.find(params[:review_id])
    end

    def current_founder?
      if current_founder != @review.founder
        not_found
      end
    end
end


