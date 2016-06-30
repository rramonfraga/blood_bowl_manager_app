json.ag @player.ag
json.av @player.av
json.cost @player.cost
json.double @player.double
json.feeder @player.feeder
json.id @player.id
json.ma @player.ma
json.normal @player.normal
json.quantity @player.quantity
json.team  do 
  json.name @player.team.name
  json.url url_for("api/templates/players/#{@player.team.id}")
end
json.title @player.title

json.skills @player.skills do |skill|
  json.name skill.name
  json.url url_for("api/templates/skills/#{skill.id}")
end

json.st @player.st

json.url url_for("api/templates/players/#{@player.id}")
json.(@player, :created_at, :updated_at)