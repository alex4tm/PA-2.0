class UserPolicy < ApplicationPolicy
  def dashboard?
    record == user
  end

  def my_bookings?
    dashboard?
  end

  def index?
    user.restaurant_owner?
  end

  def edit_profile?
    dashboard?
  end
end
