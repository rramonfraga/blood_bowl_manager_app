class Match < ActiveRecord::Base
  belongs_to :season
  belongs_to :championship, through: :season
  belongs_to :host_team, :class_name => 'UserTeam', :foreign_key => 'host_team_id'
  belongs_to :visit_team, :class_name => 'UserTeam', :foreign_key => 'visit_team_id'
  has_many :feats

  def finished!
    self.finished = true
    self.save
  
  end

  def winner_id
    if self.finished == true
      if self.host_result < self.visit_team
        self.visit_team_id
      elsif self.host_result > self.visit_team
        self.host_team_id
      else
        0
      end
    end
  end

end
