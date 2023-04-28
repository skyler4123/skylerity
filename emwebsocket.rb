require 'eventmachine'
require 'em-websocket'

EM.run do
  EM::WebSocket.run(:host => "127.0.0.1", :port => 8080) do |ws|
    ws.onopen do
      puts "WebSocket connection open"
      ws.send "Hello Client!"
    end

    ws.onmessage do |msg|
      puts "Received message: #{msg}"
      ws.send "Pong: #{msg}"
    end

    ws.onclose do
      puts "WebSocket connection closed"
    end
  end
end
