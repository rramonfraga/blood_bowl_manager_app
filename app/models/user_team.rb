class UserTeam < ActiveRecord::Base
  belongs_to :user
  has_many :user_players

  has_many :registrations
  has_many :championships, through: :registrations

  after_initialize :init

  def init
      self.treasury  ||=1000000 
      self.active ||=false       
    end
end
