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

  def add_experience!(exp)
    self.experience = self.experience + exp
    self.new_level
    self.save
  end

  def new_level
    if self.experience >= 6 && self.experience <= 15
      level_up("Experienced")
    elsif self.experience >= 15 && self.experience <= 30
      level_up("Veteran")
    elsif self.experience >= 31 && self.experience <= 50
      level_up("Emerging Star")
    elsif self.experience >= 51 && self.experience <= 75
      level_up("Star Player")
    elsif self.experience >= 76 && self.experience <= 125
      level_up("Super-Star")
    elsif self.experience >= 126 && self.experience <= 175
      level_up("Mega-Star")
    elsif self.experience >= 176
      level_up("Legend")
    end
  end

  def level_up(level)
    if self.level != level
      self.level = level
      self.level_up = true
      self.save
    end
  end

end
