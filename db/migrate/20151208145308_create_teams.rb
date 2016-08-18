class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams, class_name: 'Team' do |t|
      t.references :user, index: true
      t.string :name
      t.references :team, class_name: 'Templates::Team', index: true
      t.integer :treasury, default: 1000000
      t.integer :value
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
