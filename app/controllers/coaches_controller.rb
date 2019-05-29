class CoachesController < ApplicationController
  def show
    @age_groups = Team.all.map{ |t| t.age_group }
    @coach = Coach.find(params[:id])
    @evals = @coach.evaluations.sort_by{ |e| e.tryout.age_group}.reverse
    @flagged_evals = @evals.select{ |e| e.flag == true }
    @incomplete_evals = @evals.select{ |e| e.total_score == "incomplete" && e.flag == false }
    @completed_evals = @evals.select{ |e| e.total_score != "incomplete" && e.flag == false }

    # look for exact match first then look for name containing the query params[:player]
    if params[:player].to_i == 0 && params[:player]
      player = Player.find_by(name: params[:player].titleize)
      if player
        @tryouts = player.tryouts
      else
        @player = Player.all.select { |p| p.name.downcase.include?(params[:player].strip.downcase) }
        @tryouts = @player.map { |p| p.tryouts.last }
      end
    end
    if params[:player].to_i != 0
      @tryouts = [Tryout.find(params[:player])]
    end

    # for flags from search
    if params[:flag]
      @evaluation = Evaluation.find_by(tryout_id: params[:flag], coach_id: params[:id])
      if !@evaluation.present?
        @evaluation = Evaluation.create(tryout_id: params[:flag], coach_id: params[:id])
      end
      @evaluation.update(flag: true)
    end
  end
  
  def index
    @coaches = Coach.all
    @teams = Team.all
  end
  
  def view_results
    @age_group = params[:q].to_i
    @tryouts = Tryout.all.select { |t| t.age_group == @age_group }
    @tryouts = @tryouts.sort_by { |t| t.total_score }.reverse
    @players = @tryouts.map { |t| t.player }
  end

  def admin_show
    @age_groups = Team.all.map{ |t| t.age_group }
  end

  def new
    @coach = Coach.new
  end
  
  def create
    @coach = Coach.new(c_params)
    if @coach.save
      redirect_to coach_path(@coach)
    else
      render :new
    end
  end

  def edit
    @coach = Coach.find(params[:id])  
  end

  def update
    @coach = Coach.find(params[:id])
    if @coach.update(u_params)
      redirect_to coach_path(@coach)
    else
      render :edit
    end
  end

  def destroy
    @coach = Coach.find(params[:id])
    @evals = @coach.evaluations
    @evals.destroy_all
    @coach.destroy
    redirect_to coaches_path
  end

  def delete_tryouts
    tryouts = Tryout.all.select{ |t| t.season == params[:season].to_i }
    tryouts.each do |t| 
      t.evaluations.destroy_all
      t.destroy
    end
    redirect_to tryouts_path 
  end

  private
    def c_params
      params.require(:coach).permit(:name, :email, :password)
    end

    def u_params
      params.require(:coach).permit(:name, :email, :password, :admin)
    end
end