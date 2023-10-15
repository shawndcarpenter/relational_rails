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
    @musician = @orchestra.musicians.create({
      name: params[:name],
      instrument: params[:instrument], 
      position: params[:position], 
      years_active: params[:years_active]
    })
    redirect_to "/orchestras/#{@orchestra.id}/musicians"
  end
end
