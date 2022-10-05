require 'rails_helper'

RSpec.describe Reservation, type: :model do
  before(:each) do
    @reservation = Reservation.new(user_id: 1, airline_id: 2)
  end

  describe 'reservation validation tests' do
    it 'validates the presence of a airline' do
      @reservation.airline_id = nil
      expect(@reservation).to_not be_valid
    end

    it 'validates the presence of a user' do
      @reservation.user_id = nil
      expect(@reservation).to_not be_valid
    end

    it 'validates the presence of a airline' do
      @reservation.airline_id = 'test'
      expect(@reservation).to_not be_valid
    end

    it 'validates the presence of a user' do
      @reservation.user_id = 'test'
      expect(@reservation).to_not be_valid
    end

    it 'validates the presence of a airline' do
      @reservation.airline_id = '1'
      expect(@reservation).to_not be_valid
    end

    it 'validates the presence of a user' do
      @reservation.user_id = '2'
      expect(@reservation).to_not be_valid
    end

    it 'validates the user_id match' do
      expect(@reservation.user_id).to eq 1
    end

    it 'validates the airline_id match' do
      expect(@reservation.airline_id).to eq 2
    end
  end
end
