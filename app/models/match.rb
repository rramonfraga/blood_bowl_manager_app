class Match < ActiveRecord::Base
  belongs_to :season
  has_one :championship, through: :seasons
  belongs_to :host_team, :class_name => 'UserTeam', :foreign_key => 'host_team_id'
  belongs_to :visit_team, :class_name => 'UserTeam', :foreign_key => 'visit_team_id'
  has_many :feats

  def finished!
    self.finished = true
    self.save
  
  end

  def winner_id
    if self.finished == true
      if self.host_result < self.visit_result
        self.visit_team_id
      elsif self.host_result > self.visit_result
        self.host_team_id
      else
        0
      end
    end
  end

  def touchdonws(team)
    if self.host_team_id == team.id
      host_result
    elsif self.visit_team_id == team.id
      visit_result
    else
      0
    end
  end

end
