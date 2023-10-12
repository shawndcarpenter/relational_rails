class OrchestrasController < ApplicationController
  def index
    @orchestras = Orchestra.all
  end

  def show
    @orchestra = Orchestra.find(params[:id])
  end
end