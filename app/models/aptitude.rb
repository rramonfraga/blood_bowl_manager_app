class Aptitude < ApplicationRecord
  belongs_to :player
  belongs_to :skill, class_name: 'Templates::Skill'
end
