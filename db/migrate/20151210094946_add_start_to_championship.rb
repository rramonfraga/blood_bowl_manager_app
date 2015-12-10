class AddStartToChampionship < ActiveRecord::Migration
  def change
    add_column :championships, :start, :boolean, default: false
  end
end
