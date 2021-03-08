class BookingsController < ApplicationController
  before_action :set_restaurant_id, only: [:new, :create]


  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.restaurant = @restaurant
    @booking.user = current_user
    if @booking.save
      redirect_to restaurant_bookings_path
    # else
    #   render :new
    end
  end


  private

  def set_restaurant_id
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def booking_params
    params.require(:booking).permit(:notes, :start_date, :number_of_guests)
  end
end
