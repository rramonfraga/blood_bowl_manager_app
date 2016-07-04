class FeatsController < ApplicationController
  before_action :authenticate_user!

  def new
    @match = Match.find_by(id: params[:match_id])
    @feat = @match.feats.new
    @players = @match.host_team.players + @match.visit_team.players
  end

  def create
    @match = Match.find_by(id: params[:match_id])
    @feat = @match.feats.create player_id: params["feat"]["player_id"],
                                kind: params["kind"],
                                kind_number: params["feat"]["kind_number"]
    @feat.assign_touchdown(1)
    redirect_to action: 'new', controller: 'feats', community_id: params["community_id"], championship_id: params["championship_id"], match_id: params["match_id"]
  end

  def destroy
    feat = Feat.find_by(id: params[:id])
    feat.assign_touchdown(-1)
    feat.destroy
    redirect_to action: 'new', controller: 'feats', community_id: params["community_id"], championship_id: params["championship_id"], match_id: params["match_id"]
  end

end
