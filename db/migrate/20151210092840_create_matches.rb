class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.references :season, index: true
      t.integer :host_team_id
      t.integer :visit_team_id
      t.boolean :finished
      t.integer :host_result
      t.integer :visit_result

      t.timestamps null: false
    end
  end
end
