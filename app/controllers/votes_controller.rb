class VotesController < ApplicationController
  before_action :find_evaluation

  def upvote

    @vote = Vote.where(founder: current_founder, evaluation: @evaluation)
    if @vote.empty?
      @vote = setup_vote
      @vote.plus = true
      @vote.save
      notice = 'Thank you for voting!'
    elsif @vote.first.plus
      alert = 'Sorry, you already voted on this evaluation'
    elsif @vote.first.minus
      @vote.first.destroy
      notice = 'Thank you for voting!'
    end

    redirect_to evaluations_path, notice: notice, alert: alert
  end

  def downvote
    @vote = Vote.where(founder: current_founder, evaluation: @evaluation)
    if @vote.empty?
      @vote = setup_vote
      @vote.minus = true
      @vote.save
      notice = 'Thank you for voting!'
    elsif @vote.first.minus
      alert = 'Sorry, you already voted on this evaluation'
    elsif @vote.first.plus
      @vote.first.destroy
      notice = 'Thank you for voting!'
    end

    redirect_to evaluations_path, notice: notice, alert: alert
  end

  private

    def find_evaluation
      @evaluation = Evaluation.find(params[:evaluation_id])
    end

    def setup_vote
      vote = Vote.new
      vote.founder = current_founder
      vote.evaluation = @evaluation
      vote
    end
end
