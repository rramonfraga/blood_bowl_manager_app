class Api::Templates::PlayersController < ApplicationController
  def index
    players = ::Templates::Player.all
    render json: players, each_serializer: Api::Templates::PlayerSerializer
  end

  def show
    player = ::Templates::Player.find_by id: params[:id]
    render json: player, serializer: Api::Templates::PlayerSerializer
  end
end
