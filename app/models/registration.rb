class Registration < ActiveRecord::Base
  belongs_to :championship
  belongs_to :user_team
end
