class ChampionshipsController < ApplicationController
  before_action :authenticate_user!

  def new
    @community = Community.find_by(id: current_community.id)
    @championship = @community.championships.new
  end

  def create
    @championship = Championship.new championship_params
    if @championship.save
      render action: 'show', controller: 'communities', community_id: current_community.id
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
    team = Team.find_by(id: params[:championship][:team_ids])
    if championship.present? && team.present?
      championship.join(team)
      redirect_to action: 'show', controller: 'communities', community_id: current_community.id
    else
      render status: 404, file: '/public/404.html'
    end
  end

  def start
    championship = Championship.find_by(id: params[:id])
    championship.start! if !championship.start?     
    redirect_to action: 'show', controller: 'championships', id: championship.id
  end

  private
  def championship_params
    base_params = params.require(:championship).permit(:name, :kind, :init_treasury)
    base_params.merge!(community_id: current_community.id)
  end
end
