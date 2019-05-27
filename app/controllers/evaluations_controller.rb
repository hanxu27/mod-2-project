class EvaluationsController < ApplicationController
  def new
    #input player number first
    @evaluation = Evaluation.new
    @coach = Coach.find(params[:coach_id])
  end

  def create
    # check for previous evaluations between the coach and player
    @evaluation = Tryout.find(params[:evaluation][:tryout_id]).evaluations.find{ |e| e.coach_id == params[:coach_id]}
    
    # if !@evaluation.present?
    #   @evluation = Evaluation.new(tryout_id: params[:evaluation][:tryout_id], coach_id: params[:coach_id])
    #   if !@evaluation.save
    #     render :new
    #   end
    # end
    # redirect_to edit_evaluation_path(@evaluation)
  end

  def edit

  end

  def update

  end

  def show

  end

  def index
    # all evaluations belongs to a coach
    @coach = Coach.find(params[:coach_id])
    @evals = @coach.evaluations.sort_by{ |e| e.tryout.age_group}.reverse
  end

  def destroy

  end
end
