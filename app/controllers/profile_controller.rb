class ProfileController < ApplicationController
  def dashboard
    @category = Category.new
    @categories = current_user.categories
    authorize current_user
  end
end
