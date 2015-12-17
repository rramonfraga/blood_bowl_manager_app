class UserPlayersController < ApplicationController
  before_action :authenticate_user!


  def new
    @user_team = UserTeam.find_by(id: params[:user_team_id])
    @players = []
    16.times do 
      @players << UserPlayer.new
    end
  end

  def create
    user_team = UserTeam.find_by(id: params[:user_team_id])
    if params.has_key?("player")
      user_team.user_players.create(player_params(params["player"]))
    else
      params["players"].each do |player|
        if player["dorsal_number"] != "" || player["user_name"] != ""
          new_player = UserTeam.find_by(id: params[:user_team_id]).user_players.create(player_params(player))
          new_player.assign_stats_from_the_template
        end
      end
    end
    user_team.calculate_treasury!
    redirect_to '/'
  end

  def edit
    if @team = UserTeam.find_by(id: params[:user_team_id])
      if @team.user_id == current_user.id && @player = @team.user_players.find_by(id: params[:id])
        @skills = @player.search_normal_skills
        @skills_double = @player.search_double_skills
      else
        redirect_to action: 'show', controller: 'user_teams', id: params["user_team_id"]
      end
    else
      redirect_to action: 'show', controller: 'user_teams', id: params["user_team_id"]
    end
  end

  def update
    @player = UserPlayer.find_by(id: params[:id])
    if @player.update_player params
      redirect_to action: 'edit', controller: 'user_players', id: @player.id
    else
      render 'edit'
    end
  end

  def destroy
    player = UserPlayer.find_by(id: params[:id])
    player.destroy
    redirect_to action: 'show', controller: 'user_teams', user_team_id: params["user_team_id"]
  end

  private
  def player_params(my_params)
    my_params.permit(:user_name, :dorsal_number, :template_player_id)
  end
end
