class AddListSkillsToUserPlayer < ActiveRecord::Migration
  def change
    add_column :user_players, :list_skills, :string
  end
end
