class ChampionshipsController < ApplicationController
  before_action :authenticate_user!

  def new
    @community = Community.find_by(id: params[:community_id])
    @championship = @community.championships.new
  end

  def create
    @championship = Community.find_by(id: params[:community_id]).championships.new championship_params
    if @championship.save
      redirect_to(community_path(@championship.community_id))
    else
      render(:new)
    end
  end

  def show
    if @championship = Championship.find_by(id: params[:id])
      @clasification = @championship.clasification
    else
      render status: 404, file: '/public/404.html'
    end
  end

  def join
    championship = Championship.find_by(id: params[:id])
    if current_user && championship
      championship.teams << current_user.teams.find_by(id: params[:team_id])
      redirect_to action: 'show', controller: 'championships', community_id: championship.id, id: championship.id
    else
      render status: 404, file: '/public/404.html'
    end
  end

  def start
    championship = Championship.find_by(id: params[:id])
    if championship.start == false
      championship.start_seasons
    end      
    redirect_to action: 'show', controller: 'championships', community_id: championship.community.id, id: championship.id
  end

  private
  def championship_params
    params.require(:championship).permit(:name, :kind, :init_treasury)                                
  end
end
