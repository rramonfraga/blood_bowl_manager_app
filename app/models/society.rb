class Society < ActiveRecord::Base
  has_many :participations
  has_many :users, through: :participations
  has_many :championships

  validates :name, uniqueness: true

end
