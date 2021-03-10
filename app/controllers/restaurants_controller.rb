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
    if params[:query].present?
      @bookings = Booking.where(user.first_name == params[:query])
      @search_word = params[:query]
    else
      @bookings = Booking.all
      @search_word = "All"
    end
    @restaurant = Restaurant.find(params[:id])
    authorize @restaurant
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :tables_capacity, :category, :rating)
  end
end
