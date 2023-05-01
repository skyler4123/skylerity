namespace :stream do
  task gbpnzd: :environment do
    require 'faye/websocket'
    require 'eventmachine'
    require 'json'
    EM.run {
      ws = Faye::WebSocket::Client.new('wss://ws.binaryws.com/websockets/v3?app_id=1089')
      ws.on :open do |event|
        p [:open]
        ws.send(JSON.generate({ticks:'frxGBPNZD'}))
      end

      ws.on :message do |event|
        puts event.data
        Import::Gbpnzd.perform_async(event.data)
      end
    }
  end
end