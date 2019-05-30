class SessionsController < ApplicationController
  def new
  end

  def create
    player = Player.find_by(name: params[:session][:name].titleize)
    if player && player.authenticate(params[:session][:password])
      session[:player_id] = player.id
      flash[:success] = "You have successfully logged in"
      redirect_to player_path(player)
    else
      flash.now[:danger] = "There was something wrong with your login information"
      render 'new'
    end
  end

  def newC
  end
  
  def createC
    coach = Coach.find_by(name: params[:session][:name].titleize)
    if coach && coach.authenticate(params[:session][:password])
      session[:coach_id] = coach.id
      flash[:success] = "You have successfully logged in"
      redirect_to coach_path(coach)
    else
      flash.now[:danger] = "There was something wrong with your login information"
      render 'newC'
    end

  end

  def destroy
    session.delete :coach_id
    session.delete :player_id
    redirect_to root_path
  end


end