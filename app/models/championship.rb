class Championship < ActiveRecord::Base
  belongs_to :society
  has_many :registrations
  has_many :user_teams, through: :registrations

  validates :name, :kind, presence: true
end
