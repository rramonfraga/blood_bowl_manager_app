class Match < ActiveRecord::Base
  belongs_to :season
  belongs_to :host_team, :class_name => 'UserTeam', :foreign_key => 'host_team_id'
  belongs_to :visit_team, :class_name => 'UserTeam', :foreign_key => 'visit_team_id'

  after_initialize :init

  def init
    self.finished ||=false
    self.host_result ||=0
    self.visit_result ||=0
  end

end
