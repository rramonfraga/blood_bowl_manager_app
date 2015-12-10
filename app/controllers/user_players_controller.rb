class UserPlayersController < ApplicationController

  def new
    @user_team = UserTeam.find_by(id: params[:user_team_id])
    @players = []
    16.times do 
      @players << UserPlayer.new
    end
  end

  def create
    if params.has_key?("player")
      UserTeam.find_by(id: params[:user_team_id]).user_players.create(player_params(params["player"]))
    else
      params["players"].each do |player|
        if player["dorsal_number"] != "" || player["user_name"] != ""
          new_player = UserTeam.find_by(id: params[:user_team_id]).user_players.create(player_params(player))
          UserPlayer.assign_stats_from_the_template(new_player)
        end
      end
    end
    redirect_to '/'
  end

  def update
    
  end

  def destoy
  end

  private
  def player_params(my_params)
    my_params.permit(:user_name, :dorsal_number, :template_player_id)
  end
end
