class MusiciansController < ApplicationController
  def index
    @musicians = Musician.all
  end

  def show
    @musician = Musician.find(params[:id])
  end

  def edit
    @musician = Musician.find(params[:id])
  end

  def update
    musician = Musician.find(params[:id])
    musician.update({
      name: params[:name],
      instrument: params[:instrument], 
      position: params[:position], 
      years_active: params[:years_active]
    })
    redirect_to "/musicians/#{musician.id}"
  end

  def destroy
    musician = Musician.find(params[:id])
    musician.destroy
    redirect_to "/musicians"
  end
end