class Feat < ActiveRecord::Base
  belongs_to :user_player
  belongs_to :match


  def assign_touchdonw
    if self.kind == "touchdowns"
      if self.user_player.user_team.id == self.match.host_team.id
        self.match.host_result = self.match.host_result + 1
      else
        self.match.visit_result = self.match.visit_result + 1
      end
      self.match.save
    end
  end



end
