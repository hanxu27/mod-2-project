class TryoutsController < ApplicationController
  def new
    @tryout = Tryout.new
  end

  def create
    @tryout = Tryout.new(create_params)
    if @tryout.save
      redirect_to player_path(@tryout.player)
    else
      render :new
    end
  end

  def edit
    @tryout = Tryout.find(params[:id])
  end

  def update
    @tryout = Tryout.find(params[:id])
    if @tryout.update(update_params)
      redirect_to tryout_path(@tryout)
    else
      render :edit
    end
  end

  def show
    @tryout = Tryout.find(params[:id])
  end

  def destroy
    @tryout = Tryout.find(params[:id])
    @player = @tryout.player
    @tryout.destroy
    redirect_to player_path(@player)
  end

  def cancel
    @tryout = Tryout.find(params[:id])
    if @tryout.reach.present? || @tryout.evaluations.present?
      @tryout.errors.messages['Error:'] << 'Tryout already started, cannot cancel tryout.'
      return render :show
    end
    @player = @tryout.player
    @tryout.destroy
    redirect_to player_path(@player)
  end

  private
    def create_params
      params.require(:tryout).permit(:season, :age_group, :player_id)
    end

    def update_params
      params.require(:tryout).permit(:season, :age_group, :forms_completed, :paid, :reach, :approach_jump, :block_jump, 'point_touch', 'dash')
    end
end
