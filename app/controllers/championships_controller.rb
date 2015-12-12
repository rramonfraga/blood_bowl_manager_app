class ChampionshipsController < ApplicationController

  def show
    @championship = Championship.find_by(id: params[:id])
  end

  def join
    binding.pry
    championship = Championship.find_by(id: params[:id])
    if current_user && championship
      championship.user_teams << current_user.user_teams.find_by(id: params[:team_id])
      redirect_to "/societies/#{params[:society_id]}/championships/#{params[:id]}"
    else
      render status: 400, json: { error: "Not Join"}
    end
  end

  def start_season
    @championship = Championship.find_by(id: params[:id])
    if @championship.start == false
      @championship.start_seasons
    end
    redirect_to "/societies/#{params[:society_id]}/championships/#{params[:id]}"
  end
end
