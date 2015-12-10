class CreateSeasons < ActiveRecord::Migration
  def change
    create_table :seasons do |t|
      t.references :championship, index: true
      t.integer :round


      t.timestamps null: false
    end
  end
end
