class OrchestraMusiciansController < ApplicationController
  def index
    @orchestra = Orchestra.find(params[:id])
    @musicians = @orchestra.musicians.order(params[:sort])
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
