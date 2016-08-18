class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.references :season, index: true
      t.integer :host_team_id
      t.integer :visit_team_id
      t.boolean :finish, default: false
      t.integer :host_result, default: 0
      t.integer :visit_result, default: 0

      t.timestamps null: false
    end
  end
end
