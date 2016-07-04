json.category @skill.category
json.description @skill.description
json.id @skill.id
json.name @skill.name
json.url url_for("/api/templates/skills/#{@skill.id}")
json.(@skill, :created_at, :updated_at)