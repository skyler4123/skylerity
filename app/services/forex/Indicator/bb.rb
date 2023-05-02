class Forex::Indicator::Bb
  def calculate(candles)
    data = candles.pluck(:time, :close).map do |data|
      {
        date_time: data[0],
        close: data[1]
      }
    end
    TechnicalAnalysis::Bb.calculate(data, price_key: :close)
  end
end