class CartedGame < ApplicationRecord
  validates :quantity, comparison: { greater_than: 0 }
  belongs_to :user
  belongs_to :game
  belongs_to :order, optional: true
end
