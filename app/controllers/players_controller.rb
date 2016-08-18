class PlayersController < ApplicationController
  before_action :authenticate_user!


  def new
    @team = Team.find_by(id: params[:team_id])
    @players = @team.players.new
  end

  def create
    @team = Team.find_by(id: params[:team_id])
    @players = @team.players.new player_params
    if @player.save
      redirect_to '/'
    else
      render(:new)
    end
  end

  def destroy
    player = Player.find_by(id: params[:id])
    player.destroy
    redirect_to action: 'show', controller: 'teams', team_id: params["team_id"]
  end

  private
  def player_params(my_params)
    my_params.permit(:name, :dorsal, :player_id)
  end
end
