class MatchesController < ApplicationController
  before_action :authenticate_user!

  def show
    if @match = Match.find_by(id: params[:id])
      @host_team = @match.host_team
      @visit_team = @match.visit_team
    else
      render status: 404, file: '/public/404.html'
    end
  end

  def finish
    match = Match.find_by(id: params[:id])
    match.finish!
    redirect_to action: 'show', controller: 'championships', community_id: params["community_id"], id: params["championship_id"]
  end
end
