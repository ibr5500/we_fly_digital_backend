class Airline < ApplicationRecord
  has_many :reservations, dependent: :destroy
end
