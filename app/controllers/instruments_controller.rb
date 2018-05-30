class InstrumentsController < ApplicationController
  def index
    city = params["City"];
    category = params["category"]
    @instruments = policy_scope(Instrument).where(["city = ? and category = ?", city, category])
    # authorize @instruments
  end

  def show
    @instrument = Instrument.find(params[:id])
    @proprio = @instrument.user
    if user_signed_in?
      @booking = Booking.new
    end
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
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def params_instrument
    params.require(:instrument).permit(:title, :description, :category, :price, :image, :address, :zipcode, :country, :city)
  end
end
