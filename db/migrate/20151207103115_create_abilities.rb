class CreateAbilities < ActiveRecord::Migration
  def change
    create_table :abilities do |t|
      t.references :player, index: true
      t.references :skill, index: true

      t.timestamps null: false
    end
  end
end
