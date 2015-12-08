class UserTeam < ActiveRecord::Base
  belongs_to :user
  has_many :user_players
end
