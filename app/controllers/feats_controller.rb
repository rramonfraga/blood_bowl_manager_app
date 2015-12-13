class FeatsController < ApplicationController

  def new
    @match = Match.find_by(id: params[:match_id])
    @feat = @match.feats.new
    @players = @match.host_team.user_players + @match.visit_team.user_players
  end

  def create
    @match = Match.find_by(id: params[:match_id])
    @feat = @match.feats.create user_player_id: params["feat"]["user_player_id"],
                                kind: params["kind"],
                                kind_number: params["feat"]["kind_number"]
    @feat.assign_touchdonw
    redirect_to action: 'new', controller: 'feats', society_id: params["society_id"], championship_id: params["championship_id"], match_id: params["match_id"]
  end

  def update
  end

end
