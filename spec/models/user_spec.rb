require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.new(fullname: 'olivier gas', username: 'olivier', email: 'oliviergas@gmail.com', password:
    'xxxxxx890', created_at: '2022-10-09', updated_at: '2022-10-19')
  end
  describe 'Validations for User Model' do
    it 'that a user has a valid fullname' do
      subject.fullname = 'olivier gas'
      expect(subject).to be_valid
    end

    it 'that a user has a valid username' do
        subject.username = 'olivier'
        expect(subject).to be_valid
      end

    it 'that a user has a valid email' do
      subject.email = 'oliviergas@gmail.com'
      expect(subject).to be_valid
    end

    it 'that a user has a valid password' do
      subject.password = 'xxxxxx890'
      expect(subject).to be_valid
    end

    it 'that a user has a valid created_at' do
      subject.created_at = '2022-10-09'
      expect(subject).to be_valid
    end

    it 'that a user has a valid updated_at' do
        subject.updated_at = '2022-10-19'
        expect(subject).to be_valid
      end
  end
end
