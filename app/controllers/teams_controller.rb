class TeamsController < ApplicationController
  before_action :authenticate_user!

  def index
    @teams = current_user.teams.all
  end

  def show
    if @team = Team.find_by(id: params[:id])
      @players = @team.players
    else
      render status: 404, file: '/public/404.html'
    end
  end

  def new
    @team = current_user.teams.new
    16.times { player = @team.players.build}
  end

  def create
    pry
    @team = current_user.teams.new team_params
    params["players"].each do |player|
      if player["dorsal_number"] != "" || player["name"] != ""
        new_player = Team.find_by(id: params[:team_id]).players.create(player_params(player))
        new_player.assign_stats_from_the_template
      end
    end
    redirect_to '/'
  end

  private
  def team_params
    params.require(:team).permit(:name, :templates_team_id)                                
  end

  def player_params
    params.permit(:name, :dorsal_number, :templates_player_id)
  end
end
