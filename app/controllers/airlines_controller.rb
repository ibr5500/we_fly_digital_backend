class AirlinesController < ApplicationController
  before_action :authorize
  def index
    @airlines = @user.airlines.all
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
    @airline = Airlines.new(airline_params.merge(user: @user))
    if @airline.save
      render json: {
        status: { code: 200, message: 'Airline created sucessfully.' },
        data: @airline
      }
    else
      render json: {
        status: { code: 404, message: 'Airline Could not created !!' }
      }
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
