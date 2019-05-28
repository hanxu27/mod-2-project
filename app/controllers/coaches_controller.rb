class CoachesController < ApplicationController
  def show
    @coach = Coach.find(params[:id])
    @evals = @coach.evaluations

    @incomplete_evals = @evals.select{ |e| e.total_score == "incomplete" }
    @flagged_evals = @evals.select{ |e| e.flag == true && e.total_score != "incomplete" }
    @completed_evals = @evals.select{ |e| e.total_score != "incomplete" && e.flag == false }
  end
end
