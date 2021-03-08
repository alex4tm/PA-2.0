class CategoryPolicy < ApplicationPolicy
  class Scope < Scope
    # policy scope gives you all thhis items eg. categories.all
    def resolve
      scope.where(user: user)
    end
  end

  # copy these from application_policy.rb and set to true first
  # once you have set up all applications set to FALSE specific actions

  def create?
    !user.restaurant_owner?
  end

  def new?
    create?
  end

  def update?
    record.user == user
  end

  def edit?
    update?
  end

  def destroy?
    update?
  end
end
