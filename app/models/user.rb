class User < ApplicationRecord
  has_secure_password

  has_many :reservations, dependent: :destroy
  has_many :airlines, foreign_key: 'airline_id', dependent: :destroy

  validates :fullname, :username, :email, :password, presence: true
end
