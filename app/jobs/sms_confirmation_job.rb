class SmsConfirmationJob < ApplicationJob
  queue_as :default

  def perform(message, phone_number)
    # Do something later

    # Your Account Sid and Auth Token from twilio.com/console
    # and set the environment variables. See http://twil.io/secure
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    @client = Twilio::REST::Client.new(account_sid, auth_token)

    message = @client.messages
      .create(
         body: "Your booking is confirmed at #{message}.\n
         ✅ ✨ 😄 WE KNOW YOU, AND TAKE CARE OF YOUR PREFERENCES 🎉 🎂 🎉 ",
         from: 'whatsapp:+14155238886',
         to: "whatsapp:#{phone_number}"
       )

    puts '@' * 20
    puts message.sid
  end
end
