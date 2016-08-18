class Championship < ActiveRecord::Base
  belongs_to :community
  has_many :registrations
  has_many :teams, through: :registrations
  has_many :seasons
  has_many :matches, through: :seasons

  validates :name, :kind, :community_id, presence: true

  def create_seasons
    (@teams.count - 1).times do |index|
      season = seasons.create round: index + 1
      season.create_matches(@teams)
      rotate_teams
    end
  end

  def rotate_teams
    last = @teams.pop
    @teams.insert(1, last)
  end

  def clasification
    teams.sort do |team1, team2|
      team2.calculate_points(self) <=> team1.calculate_points(self)
    end
  end

  def join!(team)
    self.teams << team
    save!
  end

  def start!
    self.start = true
    @teams = teams.to_a
    create_seasons
    save!
  end

end
