class TeamsController < ApplicationController
  load_and_authorize_resource param_method: :s_params
  def new
    @team = Team.new
  end

  def create
    @team = Team.new(s_params)
    if @team.save
      redirect_to team_path(@team)
    else
      render :new
    end
  end

  def show
    @team = Team.find(params[:id])
  end

  def index
    @teams = Team.all.order(age_group: :desc, name: :asc)
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    @team = Team.find(params[:id])
    if params[:coach]
      Coach.find(params[:coach][:id]).update(team_id: params[:id])
      return redirect_to team_path(params[:id])
    end
    if params[:tryout]
      player = Tryout.find(params[:tryout][:id]).player
      player.update(team_id: params[:id])
      return redirect_to team_path(params[:id])
    end
    if @team.update(s_params)
      redirect_to team_path(@team)
    else
      render :new
    end
  end

  def destroy
    @team = Team.find(params[:id])
  end

  def remove
    if params[:coach_id]
      Coach.find(params[:coach_id]).update(team_id: nil)
      return redirect_to team_path(params[:id])
    end
    if params[:player_id]
      Player.find(params[:player_id]).update(team_id: nil)
      return redirect_to team_path(params[:id])
    end
  end

  private
    def s_params
      params.require(:team).permit(:name, :age_group)
    end
end
