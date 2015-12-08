class CreateUserPlayers < ActiveRecord::Migration
  def change
    create_table :user_players do |t|
      t.references :user_team, index: true
      t.string :user_name
      t.integer :player_value
      t.integer :injury
      t.integer :complentions
      t.integer :touchdowns
      t.integer :interceptions
      t.integer :casualties
      t.integer :mvp
      t.integer :ma
      t.integer :st
      t.integer :ag
      t.integer :av 

      t.timestamps null: false
    end
  end
end
