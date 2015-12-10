class Championship < ActiveRecord::Base
  belongs_to :society
  has_many :registrations
  has_many :user_teams, through: :registrations
  has_many :seasons

  validates :name, :kind, presence: true

  after_initialize :init

  def init
    self.start ||=false      
  end


  def self.start_seasons(id)
    championship = Championship.find_by(id: id)
    teams_ids = Championship.arrays_with_ids_team(championship)

    (teams_ids.size - 1).times do |index|
      season = championship.seasons.create round: index + 1
      Championship.create_matches(season, teams_ids)
      teams_ids = Championship.rotate_teams!(teams_ids)
    end

    Championship.start!(championship)
  end


  private
  def self.rotate_teams!(teams_ids)
    last = teams_ids.pop
    teams_ids.insert(1, last)
  end

  def self.arrays_with_ids_team(championship)
    championship.user_teams.map do |team|
      team.id
    end
  end

  def self.start!(championship)
    championship.start = true
    championship.save
  end

  def self.create_matches(season, teams_ids)
    teams_ids.size/2.times do |index|
      season.matches.create host_team: UserTeam.find_by(id: teams_ids[index]),
                            visit_team: UserTeam.find_by(id: teams_ids[(teams_ids.size - 1) - index])
    end
  end

end
