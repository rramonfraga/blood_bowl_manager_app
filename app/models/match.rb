class Match < ActiveRecord::Base
  belongs_to :season
  belongs_to :host_team, :class_name => 'UserTeam', :foreign_key => 'host_team_id'
  belongs_to :visit_team, :class_name => 'UserTeam', :foreign_key => 'visit_team_id'
  has_many :feats


end
