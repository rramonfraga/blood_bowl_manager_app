class Society < ActiveRecord::Base
  has_many :participations
  has_many :societies, through: :participations

  validates :name, uniqueness: true

end
