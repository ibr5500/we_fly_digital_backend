class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
    render json: { reservations: @reservations }
  end

  def create
      @user = User.find(params.find[:user_id])
      @reservation = Reservation.create(reservation_params)

      if @reservation.valid?
        token = encode_token({ user_id: @user.id })
        render json: { user: @user.fullname, reservation: @rreservation, token: }, status: :ok
      else
        render json: { error: 'Invalid date or city' }, status: :unprocessable_entity
      end
    end

  def reservation_params
    params.require(:reservation).permit(:date, :city_name)
  end 
end
