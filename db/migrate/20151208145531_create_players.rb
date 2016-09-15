class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players, class_name: 'Player' do |t|
      t.references :team, index: true
      t.string  :title
      t.string  :name
      t.references :player, class_name: 'Templates::Player', index: true
      t.integer :dorsal
      t.integer :cost
      t.integer :experience, default: 0
      t.string  :level, default: "Rookie"
      t.boolean :level_up, default: false
      t.integer  :dice_roll
      t.integer :mvp
      t.integer :ma
      t.integer :st
      t.integer :ag
      t.integer :av 

      t.timestamps null: false
    end
  end
end
