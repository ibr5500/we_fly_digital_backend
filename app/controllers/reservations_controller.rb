class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
    render json: { reservations: @reservations }
  end

  def create
      @user = User.find(params[:user_id])
      @reservation = Reservation.create(reservation_params)

      if @reservation.valid?
        token = encode_token({ reservation_id: @reservation.id })
        render json: { user: @user.fullname, reservation: @reservation, token: }, status: :ok
      else
        render json: { error: 'Invalid date or city' }, status: :unprocessable_entity
      end
    end

  def reservation_params
    params.require(:reservation).permit(:date, :city_name)
  end 
end
