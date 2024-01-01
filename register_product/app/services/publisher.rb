class Publisher
  QUEUE = 'product_queue'

  def self.connection
    conn = Bunny.new(automatically_recover: false)
    conn.start
  end

  def self.channel
    ch = connection.create_channel
    ch.queue(QUEUE, durable: true)
  end

  def self.publish(message)
    channel.publish(message.to_json, routing_key: channel.name, persistent: true)
    connection.close
  end
end
