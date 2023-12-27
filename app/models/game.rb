class Game < ApplicationRecord
  validates :title, presence: true
  validates :title, uniqueness: true
  validates :price, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :stock, numericality: { greater_than_or_equal_to: 0 }

  belongs_to :console
  has_many :carted_games
  has_many :orders, through: :carted_games
  has_many :users, through: :carted_games
  has_many :reviews
  has_many :favorites
  has_many :users, through: :reviews
end
