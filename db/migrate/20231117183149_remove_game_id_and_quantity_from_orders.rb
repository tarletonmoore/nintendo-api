class RemoveGameIdAndQuantityFromOrders < ActiveRecord::Migration[7.0]
  def change
    remove_column :orders, :game_id, :integer
    remove_column :orders, :quantity, :integer
  end
end
