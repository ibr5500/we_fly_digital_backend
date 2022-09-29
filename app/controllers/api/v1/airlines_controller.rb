class Api::V1::AirlinesController < ApplicationController
  def index
    @airlines = Airline.all
    render json: {
      data: @airlines
    }
  end

  def show
    @airline = Airline.find_by(id: params[:id])
    render json: {
      data: @airline
    }
  end
end
