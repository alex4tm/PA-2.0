class ProfileController < ApplicationController
  layout 'dashboard'
  before_action :set_layout_variables

  def dashboard
    @bookings = Booking.where(user: current_user)

    @preference = Preference.new
    authorize current_user
  end

  def my_bookings
    @bookings = Booking.where(user: current_user)
    authorize current_user
  end

  def edit_profile
    @resource ||= current_user
    authorize current_user
  end


  private

  def set_layout_variables
    @category = Category.new
    url = bookings_url(search: current_user.secure_id)
    @qrcode = RQRCode::QRCode.new(url)

    @svg = @qrcode.as_svg(
      offset: 0,
      color: '000',
      shape_rendering: 'crispEdges',
      module_size: 6
    )
  end
end
