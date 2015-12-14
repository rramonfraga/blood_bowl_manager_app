class CreateUserPlayers < ActiveRecord::Migration
  def change
    create_table :user_players do |t|
      t.references :user_team, index: true
      t.string :user_name
      t.integer :template_player_id
      t.integer :dorsal_number
      t.integer :player_value
      t.integer :experience, default: 0
      t.integer :mvp
      t.integer :ma
      t.integer :st
      t.integer :ag
      t.integer :av 

      t.timestamps null: false
    end
  end
end
