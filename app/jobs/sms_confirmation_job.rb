class SmsConfirmationJob < ApplicationJob
  queue_as :default

  def perform
    # Do something later

    # Your Account Sid and Auth Token from twilio.com/console
    # and set the environment variables. See http://twil.io/secure
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    @client = Twilio::REST::Client.new(account_sid, auth_token)

    message = @client.messages
      .create(
         body: 'Confirmation @ZUMA 2:00 PM 12.03.21. We take care of your preferences :D',
         from: 'whatsapp:+14155238886',
         to: 'whatsapp:+971507207651'
       )
    puts message.sid
  end
end
