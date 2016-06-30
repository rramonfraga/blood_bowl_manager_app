class PlayersController < ApplicationController
  before_action :authenticate_user!


  def new
    @team = Team.find_by(id: params[:team_id])
    @players = []
    16.times do 
      @players << Player.new
    end
  end

  def create
    team = Team.find_by(id: params[:team_id])
    if params.has_key?("player")
      team.players.create(player_params(params["player"]))
    else
      params["players"].each do |player|
        if player["dorsal_number"] != "" || player["name"] != ""
          new_player = Team.find_by(id: params[:team_id]).players.create(player_params(player))
          new_player.assign_stats_from_the_template
        end
      end
    end
    team.calculate_treasury!
    redirect_to '/'
  end

  def edit
    if @team = Team.find_by(id: params[:team_id])
      if @team.user_id == current_user.id && @player = @team.players.find_by(id: params[:id])
        @skills = @player.search_normal_skills
        @skills_double = @player.search_double_skills
      else
        redirect_to action: 'show', controller: 'teams', id: params["team_id"]
      end
    else
      redirect_to action: 'show', controller: 'teams', id: params["team_id"]
    end
  end

  def update
    @player = Player.find_by(id: params[:id])
    if @player.update_player params
      redirect_to action: 'edit', controller: 'players', id: @player.id
    else
      render 'edit'
    end
  end

  def destroy
    player = Player.find_by(id: params[:id])
    player.destroy
    redirect_to action: 'show', controller: 'teams', team_id: params["team_id"]
  end

  private
  def player_params(my_params)
    my_params.permit(:name, :dorsal_number, :template_player_id)
  end
end
