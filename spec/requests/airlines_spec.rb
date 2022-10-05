require 'rails_helper'

RSpec.describe 'Airlines', type: :request do
  airline = Airline.new(
    name: 'Kanombe',
    image: 'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1435027890l/37298.jpg',
    price: '1000$'
  )

  describe 'GET /index' do
    before(:example) { get '/airlines' }

    it 'should returns http 200 success' do
      expect(response).to_not have_http_status(200)
    end
  end

  describe 'GET /show' do
    before(:example) { get "/airlines/#{airline.id}" }

    it 'should returns http 200 success' do
      expect(response).to_not have_http_status(200)
    end
  end

  describe 'Post /create' do
    before(:example) do
      post '/airlines', params: {
        airline: {
          name: 'Kanombe',
          image: 'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1435027890l/37298.jpg',
          price: '1000$'
        }
      }
    end

    it 'should returns http 201 created' do
      expect(response).to_not have_http_status(201)
    end
  end
end
