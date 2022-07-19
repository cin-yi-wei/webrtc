# require 'twilio-ruby'
class DemoChannel < ApplicationCable::Channel
  def subscribed
    stream_from room_name
  end

  def receive(data)
    case data["type"]
    when "OFFER", "ANSWER", "CANDIDATE"
      ActionCable.server.broadcast(room_name, data)
    when "TOKEN"
      # client = Twilio::REST::Client.new(
      #   Rails.application.credentials.twilio_account_sid,
      #   Rails.application.credentials.twilio_auth_token
      # )
      # servers = client.tokens.create.ice_servers
      servers = TwilioClient.instance.tokens.create.ice_servers
      ActionCable.server.broadcast(room_name, { type: "TOKEN", servers: servers })
    else
      puts "Unknown signal type: #{data['type']}"
    end
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  private

  def room_name
    "demo_#{params[:name]}"
  end
end