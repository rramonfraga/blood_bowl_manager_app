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
  end

  def create
    @team = current_user.teams.new team_params
    if @team.save
      redirect_to(new_team_player_path(@team))
    else
      render(:new)
    end
  end

  private
  def team_params
    params.require(:team).permit(:name, :template_team_id)                                
  end
end
