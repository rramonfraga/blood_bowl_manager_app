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
    16.times { @team.players.build }
  end

  def create
    @team = current_user.teams.new team_params
    if @team.save
      redirect_to '/'
    else
      render(:new)
    end
  end

  private
  def team_params
    params.require(:team).permit( :name, 
                                  :team_id,
                                  :treasury, 
                                  :re_rolls, 
                                  :fan_factor, 
                                  :assistant_coaches, 
                                  :cheerleaders, 
                                  :apothecaries, 
                                  :halfling_chef,
                                  players_attributes: [:dorsal, :name, :player_id])                                
  end
end
