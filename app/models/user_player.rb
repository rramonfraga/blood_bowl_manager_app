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
    if self.experience.between?(6, 15)
      self.next_level_up("Experienced")
    elsif self.experience.between?(16, 30)
      self.next_level_up("Veteran")
    elsif self.experience.between?(31, 50)
      self.next_level_up("Emerging Star")
    elsif self.experience.between?(51, 75)
      self.next_level_up("Star Player")
    elsif self.experience.between?(76, 125)
      self.next_level_up("Super-Star")
    elsif self.experience.between?(126, 175)
      self.next_level_up("Mega-Star")
    elsif self.experience >= 176
      self.next_level_up("Legend")
    end
  end

  def next_level_up(next_level)
    if self.level != next_level
      self.level = next_level
      self.level_up = true
      self.save
    end
  end

  def search_normal_skills
    skills = []
    normal_skill_letters = Player.find_by(id: self.template_player_id).normal.split
    normal_skill_letters.each do |letter|
      skills << Skill.return_skill_with(return_name_skill_from_letter(letter))
    end
    skills
  end

  def search_double_skills
    skills = []
    normal_skill_letters = Player.find_by(id: self.template_player_id).double.split("")
    normal_skill_letters.each do |letter|
      skills << Skill.return_skill_with(return_name_skill_from_letter(letter))
    end
    skills
  end

  def update_player(params)
    if params["user_player"]["dorsal_number"] != ""
      self.dorsal_number = params["user_player"]["dorsal_number"]
    end
    if params["user_player"]["user_name"] != ""
      self.user_name = params["user_player"]["user_name"]
    end
    if params["skill"] != "" && self.level_up == true
      self.level_up = false
      self.list_skills << params["skill"]
    end
    self.save
  end

  private
  def return_name_skill_from_letter(letter)
    skill_names = { "G" => "General", "P" => "Passing", "A" => "Agility", "S" => "Strength", "E" => "Extraordinary", "M" => "Mutation", }
    skill_names[letter]
  end



end
