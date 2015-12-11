class Season < ActiveRecord::Base
  belongs_to :championship
  has_many :matches

  def create_matches(teams_ids)
    teams_ids.size/2.times do |index|
      self.matches.create host_team: UserTeam.find_by(id: teams_ids[index]),
                          visit_team: UserTeam.find_by(id: teams_ids[(teams_ids.size - 1) - index])
    end
  end
end
