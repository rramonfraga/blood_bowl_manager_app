class PlayersController < ApplicationController
  before_action :authenticate_user!

  def create
    @team = Team.find_by(id: params[:team_id])
    @players = @team.players.new player_params
    if @player.save
      redirect_to action: 'show', controller: 'teams', community_id: current_community.id, id: @team.id
    else
      render(:new)
    end
  end

  def update
    @player = Player.find_by(id: params[:id])
    @player.update_attributes(player_params)
    if @player.save
      redirect_to action: 'show', controller: 'teams', community_id: current_community.id, id: @player.team_id
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
  def player_params
    params.require(:player).permit(:name, :dorsal, :player_id)
  end
end
