class OrchestrasController < ApplicationController
  def index
    @orchestras = Orchestra.order(created_at: :desc)
  end

  def show
    @orchestra = Orchestra.find(params[:id])
  end
end