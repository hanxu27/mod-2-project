class EvaluationsController < ApplicationController
  def new
    #input player number first
    @evaluation = Evaluation.new
    @coach = Coach.find(params[:coach_id])
  end

  def create
    # check for previous evaluations between the coach and player
    @evaluation = Evaluation.find_by(tryout_id: params[:evaluation][:tryout_id], coach_id: params[:coach_id])
    if !@evaluation.present?
      @evaluation = Evaluation.new(tryout_id: params[:evaluation][:tryout_id], coach_id: params[:coach_id])
      if !@evaluation.save
        render :new
      end
    end
    redirect_to edit_coach_evaluation_path(params[:coach_id], @evaluation)
  end

  def edit
    @evaluation = Evaluation.find(params[:id])
    @teams = Team.all.select { |t| t.age_group == @evaluation.tryout.age_group }
  end

  def update
    @evaluation = Evaluation.find(params[:id])
    if @evaluation.update(edit_params)
      redirect_to coach_evaluation_path(@evaluation.coach, @evaluation)
    else
      render :edit
    end
  end

  def show
    @eval = Evaluation.find(params[:id])
  end

  def index
    # all evaluations belongs to a coach
    @coach = Coach.find(params[:coach_id])
    @evals = @coach.evaluations.sort_by{ |e| e.tryout.age_group}.reverse
    @incomplete_evals = @evals.select{ |e| e.total_score == "incomplete" }
    @flagged_evals = @evals.select{ |e| e.flag == true && e.total_score != "incomplete" }
    @completed_evals = @evals.select{ |e| e.total_score != "incomplete" && e.flag == false }
  end

  def destroy
    @eval = Evaluation.find(params[:id])
    @coach = @eval.coach
    @eval.destroy
    redirect_to coach_evaluations_path(@coach)
  end

  private
    def edit_params
      params.require(:evaluation).permit(:coachability, :athleticism, :serve, :sr, :setting, :hitting, :communication, :vball_iq, :team, :comments, :tryout_id, :coach_id, :passing, :flag)
    end
end
