class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.references :team, index: true
      t.references :championship, index: true

      t.timestamps null: false
    end
  end
end
