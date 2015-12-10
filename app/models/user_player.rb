class UserPlayer < ActiveRecord::Base
  belongs_to :user_team
  serialize :list_skills, Array

  after_initialize :init

  def init
    self.injury ||=0 
    self.complentions ||=0
    self.touchdowns ||=0 
    self.interceptions ||=0
    self.interceptions ||=0
    self.casualties ||=0
  end


  def self.assign_stats_from_the_template(player)
    template_player = Player.find_by(id: player["template_player_id"])
    player["player_value"] = template_player["cost"]
    player["title"] = template_player["title"]
    player["ma"] = template_player["ma"]
    player["st"] = template_player["st"]
    player["ag"] = template_player["ag"]
    player["av"] = template_player["av"]
    player["list_skills"] = template_player["list_skills"]
    player.save
  end

  def experience
     self.injury*2 + self.complentions + self.touchdowns*3 + self.interceptions
  end
end
