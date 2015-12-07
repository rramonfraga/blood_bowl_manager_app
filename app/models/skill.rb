class Skill < ActiveRecord::Base
  has_many :abilities
  has_many :players, throught: :abilities

  validates :name,
            :category,
            :description,
            presence: true

end
