class Templates::Player < ActiveRecord::Base
  self.table_name = 'templates_player'
  belongs_to :team, class_name: 'Templates::Team'
 
  has_many :abilities, class_name: 'Templates::Ability'
  has_many :skills, class_name: 'Templates::Skill', through: :abilities
  validates :quantity,
            :title,
            :cost,
            :ma,
            :st,
            :ag,
            :av, 
            :normal,
            :double,
            presence: true

end
