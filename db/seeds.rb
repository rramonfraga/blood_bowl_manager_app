def create_skills
  skill_file = IO.read('./public/skills.json')
  skills = JSON.parse(skill_file)
  skills.each do |skill|
    Skill.create  name: skill["name"], 
                  category: skill["category"], 
                  description: skill["description"]
  end
end

create_skills