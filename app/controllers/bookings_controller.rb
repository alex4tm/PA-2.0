class BookingsController < ApplicationController
  before_action :set_restaurant_id, only: [:new, :create]

  def index
    @bookings = policy_scope(Booking)
    @booking = Booking.new
    @restaurant = Restaurant.find(params[:restaurant_id])
    if params[:search].present?
      @available = check_availability(params[:search][:starts_at])
      @start_date = params[:search][:starts_at]
    else
      @available = false
    end
  end

  def new
    @booking = Booking.new
    authorize @booking
  end

  def create

    @booking = Booking.new(booking_params)
    @booking.restaurant = @restaurant
    @booking.user = current_user
    authorize @booking
    if @booking.save
      redirect_to '/restaurants/1'
    else
    end
  end

  private

  def check_availability(start_time)
    current_user.restaurant.tables_capacity > check_bookings(start_time).count
  end

  def check_bookings(start_time)
    Booking.where(start_date: (start_time.to_date - 2.hours..start_time.to_date + 2.weeks))
  end

  def set_restaurant_id
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def booking_params
    params.require(:booking).permit(:notes, :start_date, :number_of_guests)
  end
end
