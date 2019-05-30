class ApplicationController < ActionController::Base
  def current_user
    if session[:player_id]
      return Player.find(session[:player_id])
    elsif session[:coach_id]
      return Coach.find(session[:coach_id])
    end
  end
end
