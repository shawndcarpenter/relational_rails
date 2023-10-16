class OrchestraMusiciansController < ApplicationController
  def index
    @orchestra = Orchestra.find(params[:id])
    if params[:years_active] != nil
      @musicians = @orchestra.musicians.more_than(params[:years_active])
    else
      @musicians = @orchestra.musicians.order(params[:sort])
    end
  end

  def new
    @orchestra = Orchestra.find(params[:id])
    @musicians = @orchestra.musicians
  end

  def create
    @orchestra = Orchestra.find(params[:id])
    @musicians = @orchestra.musicians
    @musician = @orchestra.musicians.create(musician_params)
    redirect_to "/orchestras/#{@orchestra.id}/musicians"
  end

  private
  def musician_params
    params.permit(:name, :instrument, :position, :years_active, :on_leave)
  end
end
