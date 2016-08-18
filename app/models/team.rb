class Team < ActiveRecord::Base
  belongs_to :user
  belongs_to :team, class_name: 'Templates::Team'

  has_many :players

  has_many :registrations
  has_many :championships, through: :registrations
  has_many :hosting, class_name: 'Match', foreign_key: 'host_team_id'
  has_many :visiting, class_name: 'Match', foreign_key: 'visit_team_id'

  accepts_nested_attributes_for :players, reject_if: proc { |attributes| attributes['dorsal'].blank? && attributes['name'].blank? }

  validates :name, :team_id, presence: true
  validates :treasury, numericality: { greater_than_or_equal_to: 0 }

  after_create :set_value!

  FAN_FACTOR = 10000
  ASSISTANT_COACHES = 10000
  CHEERLEADERS = 10000
  APOTHECARIES = 50000


  def calculate_points(championship)
    championship.matches.reduce(0) do |points, match|
      if match.winner_id == id
        points += 3
      elsif match.winner_id == 0
        points += 1
      else
        points += 0
      end
    end
  end

  def calculate_touchdonws(championship)
    championship.matches.reduce(0) do |touchdonws, match|
      touchdonws + match.touchdonws(self)
    end
  end

  def joined?
    active_championship.present?
  end

  def active_championship
    championships.find{ |championship| !championship.finish? }
  end

  private
  def set_value!
    calculate_value
    save!
  end

  def calculate_value
    self.value = players_value + assistans_value
  end

  def players_value
    players.reduce(0){ |val, p| val + p.cost }
  end

  def assistans_value
    re_rolls * team.reroll_value +
      fan_factor * FAN_FACTOR +
      assistant_coaches * ASSISTANT_COACHES +
      cheerleaders * CHEERLEADERS +
      apothecaries * APOTHECARIES
  end
end
