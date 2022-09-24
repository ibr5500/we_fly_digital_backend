class Reservation < ApplicationRecord
  belongs_to :users
  belongs_to :airports
  belongs_to :airlines
end
