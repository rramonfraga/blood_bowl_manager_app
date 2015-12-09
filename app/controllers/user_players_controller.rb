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
      UserTeam.create(player_params(params["player"]))
    else
      params["players"].each do |player|
        if player["player"] != "" || player["player"] != ""
          UserTeam.create(player_params(player))
        end
      end
    end
  end

  def destoy
  end

  private
  def player_params(my_params)
    my_params.permit(:user_name, :dorsal_number)
  end
end
