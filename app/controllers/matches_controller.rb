class MatchesController < ApplicationController

  def show
    @match = Match.find_by(id: params[:id])
    @host_team = @match.host_team
    @visit_team = @match.visit_team
  end
end
