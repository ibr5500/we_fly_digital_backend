require 'rails_helper'

RSpec.describe Reservation, type: :model do
  before :each do
    @user = User.new(username: 'olivier', email: 'olivier@test.com', password: 'oop123')
    @user.save

    @airline = airline.new(
      user: @user,
      name: 'Michigan',
      image: 'https://www.google.com/imgres?imgurl=https%3A%2F%2Fvisitukraine.today%2Fmedia%2Fblog%2Fpreviews%2FgIhLs15lFdVvAWfmciuJc8peRNLZVQDeFdzTVGVY.jpg&imgrefurl=https%3A%2F%2Fvisitukraine.today%2Fblog%2F634%2Franking-of-the-best-airlines-in-2022&tbnid=P2Ay89-quGBrWM&vet=12ahUKEwi7r6fZs8f6AhUILRoKHQyIBtIQMygEegUIARDnAQ..i&docid=yHZFUjepIrmZNM&w=472&h=354&q=airline&client=firefox-b-e&ved=2ahUKEwi7r6fZs8f6AhUILRoKHQyIBtIQMygEegUIARDnAQ',
      price: 250
    )
    @airline.save
  end

  subject do
    Reservation.new(user: @user, airline: @airline, date: Date.today + rand(10_000))
  end
  before { subject.save }

  describe 'validate data' do
    it 'it should have a date' do
      subject.date = nil
      expect(subject).to_not be_valid
    end
  end
end
