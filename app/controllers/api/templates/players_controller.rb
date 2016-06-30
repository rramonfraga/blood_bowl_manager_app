class Api::Templates::PlayersController < ApplicationController
  def index
    @players = Templates::Player.all
    #render json: @players
  end

  def show
    @player = Templates::Player.find_by id: params[:id]
    #render json: @player
  end
end
