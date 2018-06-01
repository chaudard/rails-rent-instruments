class BookingsController < ApplicationController
  skip_after_action :verify_authorized
  before_action :set_booking, only: [:changerating, :valid, :abort]

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
    new_rating = params[:booking][:rating].to_i
    @booking.rating = new_rating
    authorize @booking

    # if booking.save
    #   redirect_to dashboard_bookings_path, notice: 'Booking rating updated'
    # else

    # end

    if @booking.save
      respond_to do |format|
        format.html { redirect_to dashboard_bookings_path, notice: 'Booking rating updated' }
        format.js  # <-- will render `app/views/bookings/changerating.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'bookings/dashboard' }
        format.js
      end
    end
  end

  def valid
    @booking.validated = true
    if @booking.save
      respond_to do |format|
        format.html { redirect_to dashboard_bookings_path, notice: 'Booking validated' }
        format.js  # <-- will render `app/views/bookings/valid.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'bookings/dashboard' }
        format.js
      end
    end
  end

  def abort
    @booking.validated = false
    if @booking.save
      respond_to do |format|
        format.html { redirect_to dashboard_bookings_path, notice: 'Booking aborted' }
        format.js  # <-- will render `app/views/bookings/abort.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'bookings/dashboard' }
        format.js
      end
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

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
