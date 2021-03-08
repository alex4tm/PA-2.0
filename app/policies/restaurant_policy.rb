class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    # policy scope gives you all thhis items eg. restaurants.all
    def resolve
      scope.where(user: user)
    end
  end

  # copy these from application_policy.rb and set to true first
  # once you have set up all applications set to FALSE specific actions

  def show?
    user.restaurant_owner?
  end
end
