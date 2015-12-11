class Championship < ActiveRecord::Base
  belongs_to :society
  has_many :registrations
  has_many :user_teams, through: :registrations
  has_many :seasons

  validates :name, :kind, presence: true


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
    self.user_teams.map do |team|
      team.id
    end
  end

  def start!
    self.start = true
    self.save
  end

end
