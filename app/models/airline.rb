class Airline < ApplicationRecord
  has_many :reservations, dependent: :destroy

  validates :name, :image, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
