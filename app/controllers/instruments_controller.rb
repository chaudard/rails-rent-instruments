class InstrumentsController < ApplicationController
  def index
  end

  def show
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
