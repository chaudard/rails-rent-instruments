class InstrumentsController < ApplicationController
  before_action :set_instrument, only: [:show, :edit, :update, :destroy]

  def index
    # address = params["address"];
    category = params["category"]
    # Topic.where("name like ?", "%#{@search}%")
    # @instruments = policy_scope(Instrument).where(["address like ? and category = ?", address, category]).where.not(latitude: nil, longitude: nil)
    @instruments = policy_scope(Instrument).where(["category = ?", category]).where.not(latitude: nil, longitude: nil)
    @markers = @instruments.map do |instrument|
      {
        lat: instrument.latitude,
        lng: instrument.longitude#,
        # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
      }
    end
  end

  def dashboard

  end

  def show
    @proprio = @instrument.user
    @booking = Booking.new
    # compute number of bookings
    @nb_bookings = Booking.where.not(user: current_user).count
    @sum_ratings = Booking.where(instrument: @instrument).sum(:rating)
    authorize @instrument
  end

  def new
    @instrument = Instrument.new
    authorize @instrument
  end

  def create
    @instrument = Instrument.new(params_instrument)
    @instrument.user = current_user
    authorize @instrument
    if @instrument.save
      redirect_to dashboard_bookings_path, notice: 'instrument created' # go to dashboard
    else
      render :new
    end
  end

  def edit
    authorize @instrument
  end

  def update
    authorize @instrument
    @instrument.update(params_instrument)
    redirect_to dashboard_bookings_path, notice: 'instrument updated'
  end

  def destroy
  end

  private

  def set_instrument
    @instrument = Instrument.find(params[:id])
  end

  def params_instrument
    params.require(:instrument).permit(:title, :description, :category, :price, :image, :address)#, :zipcode, :country, :address)
  end
end
