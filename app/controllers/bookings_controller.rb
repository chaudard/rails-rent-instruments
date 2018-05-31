class BookingsController < ApplicationController
  skip_after_action :verify_authorized

  def index

  end

  def dashboard
    # @bookings = policy_scope(Booking)
    # @instruments = policy_scope(Instrument)
    @bookings = Booking.where(user: current_user)
    @instruments = Instrument.where(user: current_user)
    @foreign_bookings = Booking.where.not(user: current_user).select { |booking| booking.instrument.user == current_user }
    authorize @instruments
    authorize @bookings
    # authorize @foreign_bookings
  end

  def changerating
    booking = Booking.find(params[:id])
    new_rating = params[:booking][:rating].to_i
    booking.rating = new_rating
    authorize booking

    if booking.save
      # redirect_to instrument_path(instrument), notice: 'Booking validated'
      redirect_to dashboard_bookings_path, notice: 'Booking rating updated'
    else

    end

  end

  def show
    authorize @booking
  end

  def new

  end

  def create
    @booking = Booking.new(params_booking)
    instrument = Instrument.find(params[:instrument_id])
    @booking.instrument = instrument
    @booking.user = current_user
    @booking.start_date = params["booking"]["start_date"].to_date
    @booking.end_date = params["booking"]["end_date"].to_date

    if @booking.save
      # redirect_to instrument_path(instrument), notice: 'Booking validated'
      redirect_to dashboard_bookings_path, notice: 'Booking created'
    else

    end

  end

  private

  def params_booking
    params.require(:booking).permit(:start_date, :end_date)
  end
end
