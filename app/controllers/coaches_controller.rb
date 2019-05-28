class CoachesController < ApplicationController
  def show
    @coach = Coach.find(params[:id])

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
  end
  
  def index
    @coaches = Coach.all
    @teams = Team.all
  end

end