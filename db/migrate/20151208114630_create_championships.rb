class CreateChampionships < ActiveRecord::Migration
  def change
    create_table :championships do |t|
      t.string :name
      t.references :society, index: true
      t.string :kind, default: "League"

      t.timestamps null: false
    end
  end
end
