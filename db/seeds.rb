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
                                        feeder: player["feeder"],
                                        list_skills: []
      
      player["skills"].each do |skill|
        new_player.list_skills << skill["name"]
        skill_to_assign = Skill.find_by(name: skill["name"])
        new_player.skills << skill_to_assign
      end
      new_player.save
    end
  end
end


def create_users
  3.times do | index |
    User.create name: "User #{index + 1}", 
                email: "email#{index + 1}@email.com",
                password: "patata00",
                password_confirmation: "patata00"
  end
end

def create_societies
  3.times do | index |
    soc1 = Society.create name: "Society #{index + 1}"
    soc2 = Society.create name: "Society #{index + 4}"
    user = User.find_by(name: "User #{index +1}")
    realsociety = Society.find_by(name: "Society 1")
    unless 1 != index 
      user.societies << realsociety
    end
    user.societies << soc1
    user.societies << soc2
  end
end

def create_championships
  3.times do |index|
    soc = Society.find_by(name: "Society #{index + 1}")
    soc.championships.create name: "Championship #{index + 1}", kind: "League"
    soc.championships.create name: "Championship #{index + 2}", kind: "League"
  end
end

create_skills
create_teams
create_players

create_users
create_societies
create_championships






