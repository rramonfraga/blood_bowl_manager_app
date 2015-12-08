class PlayersController < ApplicationController
  def index
    players = Player.all
    render status: 200, json: players
  end

  def show
    player = Player.find_by id: params[:id]
    if player
      render status: 200, json: player
    else
      render status: 404, json: { errors: "player not found" }
    end
  end
end
