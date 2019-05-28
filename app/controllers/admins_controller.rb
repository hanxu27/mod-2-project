class AdminsController < ApplicationController

  def show
    @age_groups = Team.all.map{ |t| t.age_group }
  end

  def view_results
    @age_group = params[:q].to_i
    @tryouts = Tryout.all.select { |t| t.age_group == @age_group }
    @tryouts = @tryouts.sort_by { |t| t.total_score }.reverse
    @players = @tryouts.map { |t| t.player }
  end

end
