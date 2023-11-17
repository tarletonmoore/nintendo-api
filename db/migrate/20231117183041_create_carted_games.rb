class CreateCartedGames < ActiveRecord::Migration[7.0]
  def change
    create_table :carted_games do |t|
      t.integer :user_id
      t.integer :game_id
      t.integer :quantity
      t.string :status
      t.integer :order_id

      t.timestamps
    end
  end
end
