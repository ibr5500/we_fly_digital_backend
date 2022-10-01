class User < ApplicationRecord
  has_secure_password

  has_many :reservations

  validates :fullname, :username, :email, :password, presence: true
end
