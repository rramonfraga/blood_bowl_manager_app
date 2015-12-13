class UserPlayer < ActiveRecord::Base
  belongs_to :user_team
  has_many :feats
  serialize :list_skills, Array


  def assign_stats_from_the_template
    template_player = Player.find_by(id: self.template_player_id)
    self.player_value = template_player.cost
    self.title = template_player.title
    self.ma = template_player.ma
    self.st = template_player.st
    self.ag = template_player.ag
    self.av = template_player.av
    self.list_skills = template_player.list_skills
    self.save
  end

  def experience
     self.injury*2 + self.complentions + self.touchdowns*3 + self.interceptions
  end
end
