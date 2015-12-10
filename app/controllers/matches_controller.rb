class MatchesController < ApplicationController

  def show
    @match = Match.find_by(id: params[:id])
    @host_team = @match.host_team
    @visit_team = @match.visit_team
  end

  def validate
    @match = Match.find_by(id: params[:id])
    @host_team = @match.host_team
    @visit_team = @match.visit_team
    @host_feats = @match.feats.host_feats
    @visit_feats = @match.feats.visit_feats
  end
end
