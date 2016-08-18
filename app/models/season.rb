class Season < ActiveRecord::Base
  belongs_to :championship
  has_many :matches

  def create_matches(teams)
    rounds = teams.size/2
    rounds.times do |index|
      matches.create  host_team: find_team(teams[index].id ),
                      visit_team: find_team(teams[ (teams.size - 1) - index].id )
    end
  end

  private
  def find_team(id)
    Team.find_by(id: id)
  end
end
