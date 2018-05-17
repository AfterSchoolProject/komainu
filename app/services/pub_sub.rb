class PubSub
  attr_reader :uri, :conn

  HOST = ENV['PUBSUB_HOST'] || 'http://localhost:8080'

  def initialize
    @uri = URI.join(HOST)
    @conn = Faraday.new uri
  end

  def publish(message, to_channel:)
    channel_message = { channel: to_channel, body: message }

    conn.post 'publish', channel_message
  end
end
