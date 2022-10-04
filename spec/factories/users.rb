require 'faker'

FactoryBot.define do
  factory :user do
    fullname { 'John Doe' }
    username { 'John' }
    email { Faker::Internet.unique.email }
    password { 'password' }
    password_confirmation { 'password' }
  end
end