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

end
