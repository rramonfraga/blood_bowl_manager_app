class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.references :championship, index: true

      t.timestamps null: false
    end
  end
end
