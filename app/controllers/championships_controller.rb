class ChampionshipsController < ApplicationController

  def show
    @championship = Championship.find_by(id: params[:id])
  end

  def start_season
    @championship = Championship.find_by(id: params[:id])
    if @championship.start == false
      Championship.start_seasons(params[:id])
    end
    redirect_to "/societies/#{params[:society_id]}/championships/#{params[:id]}"
  end
end
