class CoachesController < ApplicationController
  def show
    @coach = Coach.find(params[:id])
  end
  
  def index
    @coaches = Coach.all
    @teams = Team.all
  end
end