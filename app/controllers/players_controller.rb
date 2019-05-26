class PlayersController < ApplicationController
  def new
    @player = Player.new
  end

  def create
    @player = Player.new(s_params)
    if @player.save
      redirect_to edit_player_path(@player)
    else
      render :new
    end
  end

  def show
    @player = Player.find(params[:id])
  end

  def index
    @players = Player.all
  end

  def edit
    @player = Player.find(params[:id])
  end

  def update
    @player = Player.find(params[:id])
    if @player.update(s_params)
      redirect_to player_path(@player)
    else
      render :edit
    end
  end

  def destroy
    @player = Player.find(params[:id])
    @player.evaluations.each { |e| e.destroy }
    @player.tryouts.each { |t| t.destroy }
    @player.destroy
    redirect_to players_path
  end

  private
    def strong_params
      params.require(:player).permit(:name, :birthday, :height, :hand, :school, 
                                    :parent_name, :parent_number, :parent_address, :position_1,
                                    :position_2, :playing_experience, :additional_comments, :img_path, :password)
    end
    
    def s_params
      s_params = strong_params
      if strong_params[:name]
        s_params[:name] = strong_params[:name].downcase.titleize
      end
      if strong_params[:school]
        s_params[:school] = strong_params[:school].downcase.titleize
      end
      if strong_params[:parent_name]
        s_params[:parent_name] = strong_params[:parent_name].downcase.titleize
      end
      s_params
    end
end
