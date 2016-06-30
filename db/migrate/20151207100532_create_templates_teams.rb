class CreateTemplatesTeams < ActiveRecord::Migration
  def change
    create_table :templates_team, class_name: 'Templates::Team' do |t|
      t.string :name
      t.text :description
      t.integer :reroll_value
      t.boolean :apothecary
      t.boolean :stakes
      t.string :revive

      t.timestamps null: false
    end
  end
end
