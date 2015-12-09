class AddTitleToUserPlayer < ActiveRecord::Migration
  def change
    add_column :user_players, :title, :string
  end
end
