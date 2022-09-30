class ReservationsController < ApplicationController
  before_action :authorize
  def index
    @reservations = @user.reservations.all
    render json: { reservations: @reservations }
  end

  def create
    @reservation = Reservation.create(reservation_params.merge(user: @user))

    if @reservation.valid?
      token = encode_token({ reservation_id: @reservation.id })
      render json: { user: @user.fullname, reservation: @reservation, token: }, status: :ok
    else
      render json: { error: 'Invalid date or city' }, status: :unprocessable_entity
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:date, :city, :airline_id)
  end
end
