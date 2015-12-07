class Player < ActiveRecord::Base
  belongs_to :team
 
  has_many :abilities
  has_many :skills, throught: :abilities

  validates :quantity,
            :title,
            :team,
            :cost,
            :ma,
            :st,
            :ag,
            :av, 
            :normal,
            :double,
            :feeder,
            presence: true
end
