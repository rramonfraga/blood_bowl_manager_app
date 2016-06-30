class Templates::Ability < ActiveRecord::Base
  self.table_name = 'templates_ability'

  belongs_to :player, class_name: 'Templates::Player'
  belongs_to :skill, class_name: 'Templates::Skill'
end
