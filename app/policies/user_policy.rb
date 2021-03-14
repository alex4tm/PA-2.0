class UserPolicy < ApplicationPolicy
  def dashboard?
    record == user
  end

  def my_bookings?
    dashboard?
  end
end
