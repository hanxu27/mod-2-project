class EvaluationsController < ApplicationController
  def new
    #input player number first
    @evaluation = Evaluation.new
    @coach = Coach.find(params[:coach_id])
  end

  def create
    # check for previous evaluations between the coach and player
    @evaluation = Tryout.find(params[:evaluation][:tryout_id]).evaluations.find{ |e| e.coach_id == params[:coach_id]}
    
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
    skill = [@eval[:serve], @eval[:sr], @eval[:setting], @eval[:hitting], @eval[:passing]]
    soft = [@eval[:coachability], @eval[:athleticism], @eval[:communication], @eval[:vball_iq]]
    
    begin
      @skill_score = skill.sum
    rescue => exception
      @skill_score = "incomplete"
    end
    begin
      @soft_score = soft.sum
    rescue => exception
      @soft_score = "incomplete"
    end

    if @skill_score == "incomplete" || @soft_score == "incomplete" 
      @total_score = "incomplete" 
    else  
      @total_score = @skill_score + @soft_score
    end
  end

  def index
    # all evaluations belongs to a coach
    @coach = Coach.find(params[:coach_id])
    @evals = @coach.evaluations.sort_by{ |e| e.tryout.age_group}.reverse
  end

  def destroy
    @coach = @eval.coach
    @eval = Evaluation.find(params[:id])
    redirect_to coach_path(@coach)
  end

  private
    def edit_params
      params.require(:evaluation).permit(:coachability, :athleticism, :serve, :sr, :setting, :hitting, :communication, :vball_iq, :team, :comments, :tryout_id, :coach_id, :passing, :flag)
    end
end
