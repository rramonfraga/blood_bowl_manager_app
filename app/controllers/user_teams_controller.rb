class UserTeamsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user_teams = current_user.user_teams.all
  end

  def show
    if @user_team = UserTeam.find_by(id: params[:id])
      @user_players = @user_team.user_players
    else
      render status: 404, file: '/public/404.html'
    end
  end

  def new
    @user_team = current_user.user_teams.new
  end

  def create
    @user_team = current_user.user_teams.new user_team_params
    if @user_team.save
      redirect_to(new_user_team_user_player_path(@user_team))
    else
      render(:new)
    end
  end

  private
  def user_team_params
    params.require(:user_team).permit(:user_name, :template_team_id)                                
  end
end
