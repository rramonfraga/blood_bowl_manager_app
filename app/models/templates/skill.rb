class Templates::Skill < ActiveRecord::Base
  self.table_name = 'templates_skill'

  has_many :abilities, class_name: 'Templates::Ability'
  has_many :players, class_name: 'Templates::Player', through: :abilities
  validates :name,
            :category,
            :description,
            presence: true

  def self.return_skill_with(category)
    where('category = ?',category).all
  end
end
