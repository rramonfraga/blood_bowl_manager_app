class Player < ActiveRecord::Base
  belongs_to :team
  has_many :feats
  serialize :list_skills, Array

  validates :name, :dorsal_number, presence: true
  validates :dorsal_number, numericality: {only_integer: true}


  def assign_stats_from_the_template
    template_player = API::V1::Templates::Player.find_by(id: self.template_player_id)
    self.player_value = template_player.cost
    self.title = template_player.title
    self.ma = template_player.ma
    self.st = template_player.st
    self.ag = template_player.ag
    self.av = template_player.av
    self.skills = template_player.skills
    save
  end

  def add_experience!(exp)
    self.experience = self.experience + exp
    new_level
    save
  end

  def new_level
    if experience.between?(6, 15)
      next_level_up("Experienced")
    elsif experience.between?(16, 30)
      next_level_up("Veteran")
    elsif experience.between?(31, 50)
      next_level_up("Emerging Star")
    elsif experience.between?(51, 75)
      next_level_up("Star Player")
    elsif experience.between?(76, 125)
      next_level_up("Super-Star")
    elsif experience.between?(126, 175)
      next_level_up("Mega-Star")
    elsif experience >= 176
      next_level_up("Legend")
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
    normal_skill_letters = API::V1::Templates::Player.find_by(id: self.template_player_id).normal.split("")
    normal_skill_letters.each do |letter|
      skills << API::V1::Templates::Skill.return_skill_with(return_name_skill_from_letter(letter))
    end
    skills
  end

  def search_double_skills
    skills = []
    normal_skill_letters = API::V1::Templates::Player.find_by(id: self.template_player_id).double.split("")
    normal_skill_letters.each do |letter|
      skills << API::V1::Templates::Skill.return_skill_with(return_name_skill_from_letter(letter))
    end
    skills
  end

  def update_player(params)
    if params["player"]["dorsal_number"] != ""
      self.dorsal_number = params["player"]["dorsal_number"]
    end
    if params["player"]["name"] != ""
      self.name = params["player"]["name"]
    end
    if params["skill"] != "" && self.level_up == true
      self.level_up = false
      self.list_skills << params["skill"]
    end
    save
  end

  private
  def return_name_skill_from_letter(letter)
    skill_names = { "G" => "General", "P" => "Passing", "A" => "Agility", "S" => "Strength", "E" => "Extraordinary", "M" => "Mutation", }
    skill_names[letter]
  end



end
