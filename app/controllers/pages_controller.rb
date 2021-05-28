class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @user = User.first
    @restaurant = User.find(98)
  end
end
