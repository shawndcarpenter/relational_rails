class OrchestrasController < ApplicationController
  def index
    if params[:search] != nil
      @orchestras = Orchestra.search(params[:search])
    else
      @orchestras = Orchestra.order(created_at: :desc)
    end
  end

  def show
    @orchestra = Orchestra.find(params[:id])
  end

  def new   
  end

  def create
    orchestra = Orchestra.create(orchestra_params)

    redirect_to '/orchestras'
  end

  def edit
    @orchestra = Orchestra.find(params[:id])
  end

  def update
    orchestra = Orchestra.find(params[:id])
    orchestra.update(orchestra_params)
    orchestra.save

    redirect_to "/orchestras/#{orchestra.id}"
  end

  def destroy
    orchestra = Orchestra.find(params[:id])
    orchestra.destroy

    redirect_to "/orchestras"
  end

  private
  def orchestra_params
    params.permit(:name, :city, :total_conductors, :active, :search)
  end
end