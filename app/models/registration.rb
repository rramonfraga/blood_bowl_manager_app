class Registration < ActiveRecord::Base
  belongs_to :championship
  belongs_to :team
end
