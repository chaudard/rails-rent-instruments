class BookingsController < ApplicationController
  def index
  end

  def dashboard
    # @bookings = policy_scope(Booking)
    # @instruments = policy_scope(Instrument)
    # @bookings = Booking.where(user: current_user)
    @instruments = Instrument.where(user: current_user)
    authorize @instruments
    # authorize @bookings
  end

  def show
  end

  def new
  end

  def create
  end

  private

  def params_booking
    params.require(:booking).permit(:start_date, :end_date)
  end
end
