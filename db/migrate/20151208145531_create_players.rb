class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players, class_name: 'Player' do |t|
      t.references :team, index: true
      t.string  :title
      t.string  :name
      t.integer :templates_player_id
      t.integer :dorsal_number
      t.integer :value
      t.integer :experience
      t.string  :level, default: "Rookie"
      t.string  :list_skills
      t.boolean :level_up, default: false
      t.integer :mvp
      t.integer :ma
      t.integer :st
      t.integer :ag
      t.integer :av 

      t.timestamps null: false
    end
  end
end
