json.apothecary @team_template.apothecary
json.description @team_template.description
json.id @team_template.id
json.name @team_template.name

json.player_templates @team_template.player_templates do |player_template|
  json.title player_template.title
  json.quantity player_template.quantity
  json.url url_for("api/v1/player_teamplates/#{player_template.id}")
end

json.reroll_value @team_template.reroll_value

if !@team_template.revive.empty?
  json.revive @team_template.revive
end

json.stakes @team_template.stakes
json.url url_for("api/v1/team_templates/#{@team_template.id}")
json.(@team_template, :created_at, :updated_at)