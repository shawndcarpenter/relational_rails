class MusicianController < ApplicationController
  def index
    @musicians = Musician.all
  end
end