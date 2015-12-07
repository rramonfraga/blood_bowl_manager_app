class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.integer :quantity
      t.string :title
      t.references :team, index: true
      t.integer :cost
      t.integer :ma
      t.integer :st
      t.integer :ag
      t.integer :av 
      t.string :normal
      t.string :double
      t.boolean :feeder

      t.timestamps null: false
    end
  end
end
