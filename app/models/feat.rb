class Feat < ActiveRecord::Base
  belongs_to :user_player
  belongs_to :match


  def assign_touchdown(number)
    if self.kind == "touchdowns"
      if self.user_player.user_team.id == self.match.host_team.id
        self.match.host_result = self.match.host_result + number
      else
        self.match.visit_result = self.match.visit_result + number
      end
      self.match.save
    end
  end

  def assign_experience
    experience_points = {"injury" => 2, "complentions" => 1, "touchdowns" => 3, "interceptions" => 2, "mpv" => 5}
    self.user_player.add_experience!(experience_points[self.kind])
  end

end
