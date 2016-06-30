class Team < ActiveRecord::Base
  belongs_to :user
  has_many :players

  has_many :registrations
  has_many :championships, through: :registrations
  has_many :hosting, :class_name => 'Match', :foreign_key => 'host_team_id'
  has_many :visiting, :class_name => 'Match', :foreign_key => 'visit_team_id'


  def calculate_treasury!
    self.players.each do |player|
      self.treasury = self.treasury - player.player_value
    end
    self.save
  end

  def calculate_points(championship)
    championship.matches.reduce(0) do |points, match|
      if match.winner_id == self.id
        points = points + 3
      elsif match.winner_id == 0
        points = points + 1
      else
        points = points + 0
      end
    end
  end

  def calculate_touchdonws(championship)
    championship.matches.reduce(0) do |touchdonws, match|
      touchdonws + match.touchdonws(self)
    end
  end

end
