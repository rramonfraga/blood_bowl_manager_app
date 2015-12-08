class Match < ActiveRecord::Base
  belongs_to :host_team, :class_name => 'TeamUser'
  belongs_to :visitor_team, :class_name => 'TeamUser'
end
