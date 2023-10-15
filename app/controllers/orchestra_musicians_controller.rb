class OrchestraMusiciansController < ApplicationController
  def index
    @orchestra = Orchestra.find(params[:id])
    @musicians = @orchestra.musicians.order(params[:sort])
  end

  def new
  end

  def create
    #binding.pry
    @musician = @orchestra.musicians.create({
      name: params[:name],
      instrument: params[:instrument], 
      position: params[:position], 
      years_active: params[:years_active]
    })
    redirect_to "/orchestras/#{@orchestra.id}"
  end
end
