class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams, class_name: 'Team' do |t|
      t.references :user, index: true
      t.string :name
      t.integer :templates_team_id
      t.integer :treasury, default: 1000000
      t.integer :value, default: 0
      t.integer :re_rolls, default: 0
      t.integer :fan_factor, default: 0
      t.integer :assistant_coaches, default: 0
      t.integer :cheerleaders, default: 0
      t.integer :apothecaries, default: 0
      t.integer :halfling_chef, default: 0

      t.timestamps null: false
    end
  end
end
