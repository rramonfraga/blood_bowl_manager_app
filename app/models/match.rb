class Match < ActiveRecord::Base
  belongs_to :season
  has_one :championship, through: :seasons
  belongs_to :host_team, :class_name => 'Team', :foreign_key => 'host_team_id'
  belongs_to :visit_team, :class_name => 'Team', :foreign_key => 'visit_team_id'
  has_many :feats

  DRAW = 0

  def finish!
    self.finish = true
    assign_experience_from_feats
    save!
  end

  def winner_id
    return_winner_result if finish?
  end

  def return_winner_result
    if host_result < visit_result
      visit_team_id
    elsif host_result > visit_result
      host_team_id
    else
      DRAW
    end
  end

  def touchdonws(team)
    if host_team_id == team.id
      host_result
    elsif visit_team_id == team.id
      visit_result
    else
      DRAW
    end
  end

  def assign_experience_from_feats
    feats.each do |feat|
      feat.assign_experience
    end
  end

  def title
    host_team.name + ' VS ' + visit_team.name
  end

  def title_result
    host_result.to_s + " - #{title} - " +  visit_result.to_s
  end

  def can_validate?(user)
    user.id == host_team.user_id || user.id == visit_team.user_id
  end

end
