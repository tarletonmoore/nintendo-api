class AddStockToGames < ActiveRecord::Migration[7.0]
  def change
    add_column :games, :stock, :integer
  end
end
