class Match < ActiveRecord::Base
  belongs_to :host_team, :class_name => 'UserTeam', :foreing_key => 'host_team_id'
  belongs_to :visitor_team, :class_name => 'UserTeam', :foreing_key => 'visitor_team_id'
  belongs_to :championship
end
