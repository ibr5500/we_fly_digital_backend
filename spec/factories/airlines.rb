require 'faker'

FactoryBot.define do
  factory :airline do
    sequence(:name) { Faker::Name.word }
    sequence(:image) { Faker::LoremFlickr.airline }
    sequence(:price) { Faker::Number.non_zero_digit }
    user = User.first
    user_id { user.id }
  end
end
