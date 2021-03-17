class ProfileController < ApplicationController
  layout 'dashboard'
  before_action :set_layout_variables

  def dashboard
    @bookings = Booking.where(user: current_user)

    @preference = Preference.new
    authorize current_user
  end

  def my_bookings
    @category = Category.new
    @bookings = Booking.where(user: current_user)
    start_date = params.fetch(:start_date, Date.today).to_date
    @b = Booking.where(start_date: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
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
