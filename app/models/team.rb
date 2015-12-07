class Team < ActiveRecord::Base
  has_many :players
 
  validates :name,
            :description,
            :reroll_value,
            presence: true
end
