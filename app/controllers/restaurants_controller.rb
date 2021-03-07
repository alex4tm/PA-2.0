class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @user = User.first
    @restaurant = Restaurant.new(restaurant_params)
    @user.restaurant_id = @restaurant
    if @restaurant.save
      redirect_to restaurants_path
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :tables_capacity, :category, :rating)
  end
end
