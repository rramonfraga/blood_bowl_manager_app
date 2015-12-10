class ChampionshipsController < ApplicationController

  def show
    @championship = Championship.find_by(id: params[:id])
  end

end
