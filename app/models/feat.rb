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

  def assign_experience
    player = self.user_player
    case self.kind
    when "injury" 
      player.add_experience!(2)
    when "complentions" 
      player.add_experience!(1)
    when "touchdowns" 
      player.add_experience!(3)
    when "interceptions" 
      player.add_experience!(2)
    when "mpv" 
      player.add_experience!(5)
    end
  end


end
