# Download the helper library from https://www.twilio.com/docs/ruby/install
require 'rubygems'
require 'twilio-ruby'

# Your Account Sid and Auth Token from twilio.com/console
# and set the environment variables. See http://twil.io/secure
account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']
@client = Twilio::REST::Client.new(account_sid, auth_token)

message = @client.messages
  .create(
     body: 'This is a message that I want to send over WhatsApp with Twilio!',
     from: 'whatsapp:+14155238886',
     to: 'whatsapp:+15005550006'
   )

puts message.sid
