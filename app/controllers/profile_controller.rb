class ProfileController < ApplicationController
  def dashboard
    @bookings = Booking.where(user: current_user)
    @category = Category.new
    authorize current_user
  end
end
