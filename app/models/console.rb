class Console < ApplicationRecord
  validates :name, presence: true
  validates :image, presence: true
  validates :year, presence: true

  has_many :games
end
