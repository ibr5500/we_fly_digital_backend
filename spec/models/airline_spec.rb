require 'rails_helper'

RSpec.describe Airline, type: :model do
  subject do
    airline = Airline.new(
      name: 'Rwandair',
      price: '100',
      user_id: '1'
    )

    return airline
  end

  describe 'Validations for Airline Model' do
    it 'An Airline should have a valid name' do
      subject.name = 'amsterdam'
      expect(subject).to_not be_valid
    end
    
    it 'An Airline should have a valid user_id' do
        subject.user_id = '2'
        expect(subject).to_not be_valid
    end
  end
end
