class AirlinesController < ApplicationController
  before_action :authorize
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

  def create
    @airline = Airline.new(airline_params.merge(user: @user))

    if @airline.save
      token = encode_token({ airline_id: @airline.id })
      render json: { user: @user.fullname, airline: @airline, token: }, status: :ok
    else
      render json: { error: 'Invalid date or city' }, status: :unprocessable_entity
    end
  end

  def destroy
    @airline = Airline.find(id: params[:id])

    if @airline.nil?
      render json: { status: { code: 404, message: 'Airline could not found' } }
      nil
    else
      @airline.destroy
      render json: { status: { code: 200, message: 'Airline has been deleted sucessfully' } }
    end
  end

  private

  def airline_params
    params.require(:airline).permit(:name, :image, :price, :user_id)
  end
end
