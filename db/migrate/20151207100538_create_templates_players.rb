class CreateTemplatesPlayers < ActiveRecord::Migration
  def change
    create_table :templates_player, class_name: 'Templates::Player' do |t|
      t.integer :quantity
      t.string :title
      t.references :team, class_name: 'Templates::Team', index: true
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
