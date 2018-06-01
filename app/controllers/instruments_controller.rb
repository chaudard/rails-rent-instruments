class InstrumentsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_instrument, only: [:show, :edit, :update, :destroy]
  skip_after_action :verify_policy_scoped

  def index
    # address = params["address"];

    @category = params[:search][:category] if params[:search]
    @category = params[:category] if params[:category]

    if params[:query].present?
      @instruments = Instrument.search_by_title_and_description(params[:query])
    else
      @instruments = Instrument.all
    end

    # if params[:city].present?
    #   @instruments = @instruments.where("city ILIKE ?", "%#{params[:city]}%")
    # end

    # Topic.where("name like ?", "%#{@search}%")
    if @category != nil
      @instruments = @instruments.where(category: @category).where.not(latitude: nil, longitude: nil, image: nil)
    end
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
    @nb_bookings = Booking.where(instrument: @instrument).count
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
      redirect_to dashboard_bookings_path, notice: 'Instrument Created !' # go to dashboard
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
    redirect_to dashboard_bookings_path, notice: 'Instrument Updated !'
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
