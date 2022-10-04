require 'rails_helper'

RSpec.describe 'Airlines', type: :request do
  before(:all) do
    @user = FactoryBot.create(:user)
    post 'login', params: { user: { email: @user.email, password: @user.password } }, as: :json
    @authorization = response.header['Authorization']
    @airline = FactoryBot.create_list(:airline, 30)
  end
  describe 'GET /airlines' do
    it 'return unauthorized if user not logged in' do
      get '/airliness'
      expect(response).to have_http_status(:unauthorized)
    end

    it 'returns a list of airlines if user is logged in' do
      get '/airlines', headers: { Authorization: @authorization }
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /airlines/:id' do
    it 'returns an airline if user is logged in' do
      get '/airlines/1', headers: { Authorization: @authorization }
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST /airlines' do
    it 'creates an airline if user is logged in' do
      post '/airlines',
           params: { airline: { name: 'Michigan', image: 'https://www.google.com/imgres?imgurl=https%3A%2F%2Fvisitukraine.today%2Fmedia%2Fblog%2Fpreviews%2FgIhLs15lFdVvAWfmciuJc8peRNLZVQDeFdzTVGVY.jpg&imgrefurl=https%3A%2F%2Fvisitukraine.today%2Fblog%2F634%2Franking-of-the-best-airlines-in-2022&tbnid=P2Ay89-quGBrWM&vet=12ahUKEwi7r6fZs8f6AhUILRoKHQyIBtIQMygEegUIARDnAQ..i&docid=yHZFUjepIrmZNM&w=472&h=354&q=airline&client=firefox-b-e&ved=2ahUKEwi7r6fZs8f6AhUILRoKHQyIBtIQMygEegUIARDnAQ', price: '250', user_id: @user.id } },
           headers: { Authorization: @authorization }
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'PUT /airlines/:id' do
    it 'updates an airline if user is logged in' do
      put '/airline/1',
            params: { airline: { name: 'Michigan', image: 'https://www.google.com/imgres?imgurl=https%3A%2F%2Fvisitukraine.today%2Fmedia%2Fblog%2Fpreviews%2FgIhLs15lFdVvAWfmciuJc8peRNLZVQDeFdzTVGVY.jpg&imgrefurl=https%3A%2F%2Fvisitukraine.today%2Fblog%2F634%2Franking-of-the-best-airlines-in-2022&tbnid=P2Ay89-quGBrWM&vet=12ahUKEwi7r6fZs8f6AhUILRoKHQyIBtIQMygEegUIARDnAQ..i&docid=yHZFUjepIrmZNM&w=472&h=354&q=airline&client=firefox-b-e&ved=2ahUKEwi7r6fZs8f6AhUILRoKHQyIBtIQMygEegUIARDnAQ', price: '250', user_id: @user.id } },
            headers: { Authorization: @authorization }
        expect(response).to have_http_status(:ok)
    end
  end

  describe 'DELETE /airlines/:id' do
    it 'deletes an airline if user is logged in' do
      delete '/airline/1', headers: { Authorization: @authorization }
      expect(response).to have_http_status(:ok)
    end
  end
end
