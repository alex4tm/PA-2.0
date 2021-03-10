class BookingsController < ApplicationController
  before_action :set_restaurant_id, only: [:new, :create]

  def index
    # find the user based on the secure ID
    @categories = policy_scope(Category).order(created_at: :desc)
    @restaurant = Restaurant.find(params[:restaurant_id])
    if params[:search].present?
      @user = User.find_by(secure_id: params[:search])

      @error_message = "User Not Found" if @user.nil?
    end
    # Returns all the bookings
    @bookings = policy_scope(Booking)
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
      redirect_to restaurant_bookings_path
    else
      render :new
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
