class CoachesController < ApplicationController
  def show
    @coach = Coach.find(params[:id])
    @evals = @coach.evaluations
  end
end
