def create_skills
  skill_file = IO.read('./public/skills.json')
  skills = JSON.parse(skill_file)
  skills.each do |skill|
    Skill.create  name: skill["name"], 
                  category: skill["category"], 
                  description: skill["description"]
  end
end

def create_teams
  team_file = IO.read('./public/teams.json')
  teams = JSON.parse(team_file)
  teams.each do |team|
    Team.create   name: team["name"], 
                  reroll_value: team["reroll_value"], 
                  description: team["description"],
                  stakes: team["stakes"], 
                  revive: team["revive"],
                  apothecary: team["apothecary"]
  end
end


def create_players
  team_file = IO.read('./public/teams.json')
  teams = JSON.parse(team_file)
  teams.each do |this_team|
    team = Team.find_by(name: this_team["name"])
    this_team["players"].each do |player|
      new_player = team.players.create  quantity: player["quantity"], 
                                        title: player["title"], 
                                        cost: player["cost"],
                                        ma: player["ma"], 
                                        st: player["st"],
                                        ag: player["ag"], 
                                        av: player["av"],
                                        normal: player["normal"],
                                        double: player["double"],
                                        feeder: player["feeder"]
      
      player["skills"].each do |skill|
        skill_to_assign = Skill.find_by(name: skill["name"])
        new_player.skills << skill_to_assign
      end
    end
  end
end

create_skills
create_teams
create_players



