class CreateUserTeams < ActiveRecord::Migration
  def change
    create_table :user_teams do |t|
      t.references :user, index: true
      t.string :user_name
      t.integer :treasury
      t.integer :team_value
      t.integer :re_rolls
      t.integer :fan_factor
      t.integer :assistant_coaches
      t.integer :cheerleaders
      t.integer :apothecaries
      t.integer :halfling_chef

      t.timestamps null: false
    end
  end
end
