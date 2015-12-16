class ChampionshipsController < ApplicationController
  before_action :authenticate_user!

  def new
    @society = Society.find_by(id: params[:society_id])
    @championship = @society.championships.new
  end

  def create
    @championship = Society.find_by(id: params[:society_id]).championships.new championship_params
    if @championship.save
      redirect_to(society_path(@championship.society_id))
    else
      render(:new)
    end
  end

  def show
    @championship = Championship.find_by(id: params[:id])
    @clasification = @championship.clasification
  end

  def join
    championship = Championship.find_by(id: params[:id])
    if current_user && championship
      championship.user_teams << current_user.user_teams.find_by(id: params[:team_id])
      redirect_to action: 'show', controller: 'championships', society_id: championship.id, id: championship.id
    else
      render status: 404, html: 404
    end
  end

  def start
    championship = Championship.find_by(id: params[:id])
    if championship.start == false
      championship.start_seasons
    end      
    redirect_to action: 'show', controller: 'championships', society_id: championship.society.id, id: championship.id
  end

  private
  def championship_params
    params.require(:championship).permit(:name, :kind, :init_treasury)                                
  end
end
