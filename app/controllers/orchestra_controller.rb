class OrchestraController < ApplicationController
  def index
    @orchestras = Orchestra.all
  end
end