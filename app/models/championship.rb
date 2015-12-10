class Championship < ActiveRecord::Base
  belongs_to :society
  has_many :registrations
  has_many :user_teams, through: :registrations
  has_many :matches

  validates :name, :kind, presence: true
end
