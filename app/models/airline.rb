class Airline < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'
  has_many :reservations, dependent: :destroy

  validates :name, uniqueness: true, presence: true
  validates :image, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
