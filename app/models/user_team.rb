class UserTeam < ActiveRecord::Base
  belongs_to :user
  has_many :user_players

  has_many :registrations
  has_many :championships, through: :registrations
  has_many :hosting, :class_name => 'Match', :foreing_key => 'host_team_id'
  has_many :visiting, :class_name => 'Match', :foreing_key => 'visitor_team_id'



  after_initialize :init

  def init
      self.treasury  ||=1000000 
      self.active ||=false       
    end
end
