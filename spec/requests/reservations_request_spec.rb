require 'rails_helper'

RSpec.describe 'Reservations', type: :request do
  before(:all) do
    @user = FactoryBot.create(:user)
    post '/login', params: { user: { email: @user.email, password: @user.password } }, as: :json
    @authorization = response.header['Authorization']
    @airline = FactoryBot.create(:airline)
  end

  describe 'POST /reservations' do
    it 'creates a new reservation' do
      post '/reservations', params: {
        reservation: {
          user_id: @user.id,
          airline_id: @hairline.id,
          date: '2022-10-04'
        }
      }, headers: { Authorization: @authorization }
      expect(response).to have_http_status(:ok)
    end

    it 'returns an error if the user is not logged in' do
      post '/reservations', params: {
        reservation: {
            user_id: @user.id,
            airline_id: @hairline.id,
            date: '2022-10-04'
        }
      }
      expect(response).to have_http_status(:unauthorized)
    end
  end

  describe 'GET /reservations' do
    it 'returns all reservations' do
      get '/reservations', headers: { Authorization: @authorization }
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /reservations/:id' do
    it 'returns a reservation' do
      get '/eservations/1', headers: { Authorization: @authorization }
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'PUT /reservations/:id' do
    it 'updates a reservation' do
      put '/reservations/1', params: {
        reservation: {
            user_id: @user.id,
            airline_id: @hairline.id,
            date: '2022-10-04'
        }
      }, headers: { Authorization: @authorization }
      expect(response).to have_http_status(:ok)
    end
  end
end
