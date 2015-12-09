class Player < ActiveRecord::Base
  belongs_to :team
 
  has_many :abilities
  has_many :skills, through: :abilities

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

  serialize :list_skills, Array
end
