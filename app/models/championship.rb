class Championship < ActiveRecord::Base
  belongs_to :society
  has_many :registrations
  has_many :teams, through: :registrations
  has_many :seasons
  has_many :matches, through: :seasons

  validates :name, :kind, presence: true

  def has_team_included?(team)
    self.teams.reduce(false) do |included, championship_team|
      included || championship_team.id == team.id
    end
  end

  def has_team_included_a_user?(user)
    user.teams.reduce(false) do |included, team|
      included || self.has_team_included?(team)
    end
  end

  def start_seasons
    teams_ids = self.arrays_with_ids_team
    (teams_ids.size - 1).times do |index|
      season = self.seasons.create round: index + 1
      season.create_matches(teams_ids)
      teams_ids = self.rotate_teams!(teams_ids)
    end
    self.start!
  end

  def rotate_teams!(teams_ids)
    last = teams_ids.pop
    teams_ids.insert(1, last)
  end

  def arrays_with_ids_team
    self.teams.map do |team|
      team.id
    end
  end

  def start!
    self.start = true
    self.save
  end

  def clasification
    self.teams.sort do |team1, team2|
      team2.calculate_points(self) <=> team1.calculate_points(self)
    end
  end

end
