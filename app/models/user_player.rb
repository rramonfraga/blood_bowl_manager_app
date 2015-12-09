class UserPlayer < ActiveRecord::Base
  belongs_to :user_team
  serialize :list_skills, Array


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
end
