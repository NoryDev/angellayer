class VotesController < ApplicationController

  def new
    @vote = Vote.new
    @vote.founder = current_founder
    @vote.evaluation = Evaluation.find(params[:evaluation_id])
    @vote.plus = true
    @vote.save
    redirect_to evaluations_path
  end

  def downvote
    @vote = Vote.new
    @vote.founder = current_founder
    @vote.evaluation = Evaluation.find(params[:evaluation_id])
    @vote.minus = true
    @vote.save
    redirect_to evaluations_path
  end

  def update
  end
end
