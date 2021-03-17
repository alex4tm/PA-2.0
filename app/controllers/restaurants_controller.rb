class RestaurantsController < ApplicationController
  # def index

  #   @restaurants = policy_scope(Restaurant).order(created_at: :desc)
  # end

  # def new
  #   @restaurant = Restaurant.new
  #   authorize @restaurant
  # end

  # def create
  #   @user = User.first
  #   @restaurant = Restaurant.new(restaurant_params)
  #   @user.restaurant_id = @restaurant
  #   if @restaurant.save
  #     redirect_to restaurants_path
  #   end
  # end

  def show

    @bookings = Booking.all.order(created_at: :DESC)
    @search_word = "All"
    @restaurant = current_user.restaurant
    authorize @restaurant
    @booking = Booking.find_by(params[:booking_id])
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :tables_capacity, :category, :rating)
  end
end
