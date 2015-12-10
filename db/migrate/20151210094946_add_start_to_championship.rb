class AddStartToChampionship < ActiveRecord::Migration
  def change
    add_column :championships, :start, :boolean
  end
end
