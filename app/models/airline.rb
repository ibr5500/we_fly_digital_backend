class Airline < ApplicationRecord
  has_and_belongs_to_many :airports, dependent: :destroy
end
