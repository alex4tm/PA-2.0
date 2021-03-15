class ProfileController < ApplicationController
  layout 'dashboard'
  def dashboard
    @bookings = Booking.where(user: current_user)
    @category = Category.new
    authorize current_user
    qr_code
  end

  def my_bookings
    @bookings = Booking.where(user: current_user)
    authorize current_user
    qr_code
  end



  private

  def qr_code
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
