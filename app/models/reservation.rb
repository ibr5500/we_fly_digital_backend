class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :airline

  validates :city, :date, presence: true
end
