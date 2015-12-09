class TeamsController < ApplicationController

  def index
    teams = Team.all
    render status: 200, json: teams
  end

  def show
    team = Team.find_by id: params[:id]
    if team
      render status: 200, json: team
    else
      render status: 404, json: { errors: "team not found" }
    end
  end

  def show_players
    team = Team.find_by id: params[:id]
    if team
      players = team.players
      render status: 200, json: players
    else
      render status: 404, json: { errors: "players from the team not found" }
    end
  end

end
