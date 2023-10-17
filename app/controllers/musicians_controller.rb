class MusiciansController < ApplicationController
  def index
    @musicians = Musician.on_leave
  end

  def show
    @musician = Musician.find(params[:id])
  end

  def edit
    @musician = Musician.find(params[:id])
  end

  def update
    musician = Musician.find(params[:id])
    musician.update(musician_params)
    redirect_to "/musicians/#{musician.id}"
  end

  def destroy
    musician = Musician.find(params[:id])
    musician.destroy
    redirect_to "/musicians"
  end

  private
  def musician_params
    params.permit(:name, :instrument, :position, :years_active, :on_leave)
  end
end