class AddSkillToPlayer < ActiveRecord::Migration
  def change
    add_column :players, :list_skills, :string
  end
end
