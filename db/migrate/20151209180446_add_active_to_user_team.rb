class AddActiveToUserTeam < ActiveRecord::Migration
  def change
    add_column :user_teams, :active, :boolean
  end
end
