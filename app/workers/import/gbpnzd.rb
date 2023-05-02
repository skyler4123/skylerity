class Import::Gbpnzd
  include Sidekiq::Worker
  sidekiq_options retry: true

  def perform(event_data)
    data = JSON.parse(event_data)['tick']
    Gbpnzd.create(
      epoch: data['epoch'],
      quote: data['quote']
    )
    tick_time = Time.at(data['epoch']).utc
    price = data['quote']

    candle = GbpnzdM5.where(time: tick_time.change(sec: 0, min: (tick_time.min - (tick_time.min % 5)))).first
    candle_1 = GbpnzdM5.where(time: (tick_time.change(sec: 0, min: (tick_time.min - (tick_time.min % 5))) - 5.minutes)).first
    candle_2 = GbpnzdM5.where(time: (tick_time.change(sec: 0, min: (tick_time.min - 10 - (tick_time.min % 5)))) - 10.minutes).first

    change = price - (candle_1 ? candle_1.close : 0)
    percentage = ((price - (candle_1 ? candle_1.close : 0))/(candle_1 ? candle_1.close : price)).round(5)*100
    opened = (candle_1 ? candle_1.close : 0)
    
    if tick_time.min % 5 == 4 && (tick_time.sec == 58 || tick_time.sec == 59) 
      puts  'check condition to trade'
      trend = true if candle_1.percentage.positive? && candle_2.percentage.positive?
      trend = false if candle_1.percentage.negative? && candle_2.percentage.negative?
      return if candle && candle_1 && candle_2
      return if candle.hammer?
      # return if candle.percentage.abs.in?(-0%..+3%)
      return if candle.percentage > 0.02 && candle_1.percentage > 0.039
      return if candle_1.percentage.abs > 0.10
      return if candle_1.percentage < candle_2.percentage
      return if candle_1.percentage*candle_2.percentage < 0
      return if candle_1.shadow_ratio > 0.5
      return if Time.now.utc.in?(pending_trade)
    end

    if candle
      candle.update_attributes!(
        high: [candle.high, price].max,
        low: [candle.low, price].min,
        close: price,
        change: change,
        percentage: percentage,
      )
    else
      GbpnzdM5.create!(
        time: tick_time.change(sec: 0, min: (tick_time.min - (tick_time.min % 5))),
        opened: opened,
        high: price,
        low: price,
        close: price,
        change: change,
        percentage: percentage,
      )
    end
  rescue Exception => e
    puts e
  end

end