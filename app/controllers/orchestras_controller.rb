class OrchestrasController < ApplicationController
  def index
    @orchestras = Orchestra.order(created_at: :desc)
  end

  def show
    @orchestra = Orchestra.find(params[:id])
  end

  def new   
  end

  def create
    orchestra = Orchestra.new({
      name: params[:name],
      city: params[:city],
      total_conductors: params[:total_conductors],     
    })

    orchestra.save

    redirect_to '/orchestras'
  end
end