class Society < ActiveRecord::Base
  has_many :participations
  has_many :societies, through: :participations

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :name, length: {minimun: 6}
  validates :name, format: {with: /[A-Za-z0-9\s]/}
end
