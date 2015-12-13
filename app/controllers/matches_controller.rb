class MatchesController < ApplicationController

  def show
    @match = Match.find_by(id: params[:id])
    @host_team = @match.host_team
    @visit_team = @match.visit_team
  end

  def finished
    match = Match.find_by(id: params[:id])
    match.finished!
    redirect_to action: 'show', controller: 'championships', society_id: params["society_id"], id: params["championship_id"]
  end
end
