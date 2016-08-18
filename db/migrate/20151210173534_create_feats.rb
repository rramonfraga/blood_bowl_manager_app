class CreateFeats < ActiveRecord::Migration
  def change
    create_table :feats do |t|
      t.references :match, index: true
      t.references :player, index: true
      t.string :kind
      t.string :casuality
      t.boolean :host_team, default: false

      t.timestamps null: false
    end
  end
end
