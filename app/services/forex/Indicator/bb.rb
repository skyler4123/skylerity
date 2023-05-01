class Forex::Indicator::Bb
  def calculate
    data = Gbpnzd.last(100).pluck(:epoch, :quote).map do |data|
      {
        date_time: Time.at(data[0]),
        close: data[1]
      }
    end
    TechnicalAnalysis::Bb.calculate(data, price_key: :close)
  end
end