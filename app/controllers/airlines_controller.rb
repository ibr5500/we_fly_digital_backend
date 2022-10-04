class AirlinesController < ApplicationController
  before_action :authorize
  def index
    @airlines = Airline.includes(:user).all
    render json: {
      data: @airlines
    }
  end

  def show
    @airline = Airline.includes(:user).find_by(id: params[:id])
    render json: {
      data: @airline
    }
  end

  def create
    @airline = Airline.new(airline_params.merge(user: @user))
    if @airline.save
      render json: { message: 'Airline Created Sucessfully' }, status: :ok
    else
      render json: { error: 'Invalid data, Couldn\'t created an Airline' }, status: :unprocessable_entity
    end
  end

  def destroy
    @airline = Airline.includes(:user).find_by(id: params[:id])
    if @airline.destroy
      render json: {
        message: 'Airline has been deleted Sucessfully',
        data: Airline.all
      }
    else
      render json: { status: { code: 404, message: 'Airline could not found' } }
    end
  end

  private

  def airline_params
    params.require(:airline).permit(:name, :image, :price)
  end
end
