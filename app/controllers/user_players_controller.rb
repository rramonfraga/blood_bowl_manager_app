class UserPlayersController < ApplicationController

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
    @player = UserPlayer.find_by(id: params[:id])
    @skills = @player.search_normal_skills
    @skills_double = @player.search_double_skills
  end

  def update
    @player = UserPlayer.find_by(id: params[:id])
  end

  def destoy
  end

  private
  def player_params(my_params)
    my_params.permit(:user_name, :dorsal_number, :template_player_id)
  end
end
