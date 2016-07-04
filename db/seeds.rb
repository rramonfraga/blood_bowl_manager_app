
=begin
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
=end

def create_skill_templates
  skill_file = IO.read('./public/skills.json')
  skills = JSON.parse(skill_file)
  skills.each do |skill|
    Templates::Skill.create name: skill["name"], 
                            category: skill["category"], 
                            description: skill["description"]
  end
end

def create_team_templates
  team_file = IO.read('./public/teams.json')
  teams = JSON.parse(team_file)
  teams.each do |team|
    Templates::Team.create name: team["name"], 
                        reroll_value: team["reroll_value"], 
                        description: team["description"],
                        stakes: team["stakes"], 
                        revive: team["revive"],
                        apothecary: team["apothecary"]
  end
end


def create_player_templates
  team_file = IO.read('./public/teams.json')
  teams = JSON.parse(team_file)
  teams.each do |this_team|
    team = Templates::Team.find_by(name: this_team["name"])
    this_team["players"].each do |player|
      new_player = team.players.create quantity: player["quantity"], 
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
        skill_to_assign = Templates::Skill.find_by(name: skill["name"])
        new_player.skills << skill_to_assign
      end
      new_player.save
    end
  end
end

def create_user
  User.create(name: 'Rafa', email: 'rafael@cabify.com', password: 'Croqueto22')
end

create_skill_templates
create_team_templates
create_player_templates
create_user


=begin
def create_users
  4.times do | index |
    User.create name: "User #{index + 1}", 
                email: "email#{index + 1}@email.com",
                password: "patata00",
                password_confirmation: "patata00"
  end
end

def create_communities
  community = Community.create name: "Community 1"
  4.times do | index |
    user = User.find_by(name: "User #{index +1}")
    user.communities << community
  end
end

def create_championships
  community = Community.find_by(name: "Community 1")
  community.championships.create name: "Championship", kind: "League"
end

def create_team_and_players
  4.times do | index |
    user = User.find_by(name: "User #{index +1}")
    random = Random.new
    random = random.rand(24)
    team = user.teams.create name: "Team #{index + 1}",
                                  template_team_id: random,
                                  re_rolls: 2,
                                  fan_factor: 0,
                                  assistant_coaches: 0,
                                  cheerleaders: 0,
                                  apothecaries: 0,
                                  halfling_chef: 0
    11.times do |index| 
      number = Team.find_by(id: random).players.first.id
      player = team.players.create name: "Player #{index + 1}",
                                        dorsal_number: "#{index + 1}",
                                        template_player_id: number
      player.assign_stats_from_the_template
    end
    championship = Championship.find_by(name: "Championship")
    team.championships << championship
    team.calculate_treasury!
  end
end

create_skills
create_teams
create_players

=end
=begin
  create_users
  create_communities
  create_championships
  create_team_and_players
=end






