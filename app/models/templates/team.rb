class Templates::Team < ActiveRecord::Base
  self.table_name = 'templates_team'
  has_many :players, class_name: 'Templates::Player'

  validates :name,
            :description,
            :reroll_value,
            presence: true
end
