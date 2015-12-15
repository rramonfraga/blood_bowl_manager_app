class Skill < ActiveRecord::Base
  has_many :abilities
  has_many :players, through: :abilities

  validates :name,
            :category,
            :description,
            presence: true

  def self.return_skill_with(category)
    where('category = ?',category).all
  end

end
