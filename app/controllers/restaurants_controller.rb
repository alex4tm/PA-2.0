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
    if params[:search].present?
      @user = User.where(secure_id: params[:search])
    else
      @bookings = Booking.all.order("id DESC")
      @search_word = "All"
    end

    @bookings = Booking.all
    @restaurant = Restaurant.find(params[:id])
    authorize @restaurant
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :tables_capacity, :category, :rating)
  end
end
