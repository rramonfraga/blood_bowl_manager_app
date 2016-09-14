class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
         

  has_many :participations
  has_many :communities, through: :participations

  has_many :teams

  def free_teams
    teams.map { |team| team if !team.joined? }
  end

  def championships
    teams.flat_map { |team| team.championships }.compact
  end

end
