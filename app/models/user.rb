class User < ApplicationRecord
  has_secure_password

  has_many :reservations, dependent: :destroy
  has_many :airlines, foreign_key: 'airline_id', dependent: :destroy

  validates :password, presence: true
  validates :fullname, :email, :username, uniqueness: true, presence: true
end
