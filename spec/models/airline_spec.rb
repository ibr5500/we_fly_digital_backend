require 'rails_helper'

RSpec.describe Airline, type: :model do
  subject do
    airline = Airline.new(
      name: 'Kanombe'
    )

    return airline
  end

  describe 'Validations for Airline Model' do
    it 'An Airline should have a valid name' do
      subject.name = 'amsterdam'
      expect(subject).to_not be_valid
    end
  end
end
