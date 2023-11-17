class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  has_many :orders
  has_many :carted_games
  has_many :games, through: :carted_games
  has_many :orders, through: :carted_games
end
