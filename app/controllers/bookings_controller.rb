class BookingsController < ApplicationController
  def index
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
