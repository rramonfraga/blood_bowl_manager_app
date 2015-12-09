class UserTeam < ActiveRecord::Base
  belongs_to :user
  has_many :user_players

  after_initialize :init

  def init
      self.treasury  ||=1000000        
    end
end
