class Forex::Indicator::Bb
  def calculate
    data = Gbpnzd.last(100).pluck(:epoch, :quote).map do |data|
      {
        date_time: Time.utc.at(data[0]),
        value: data[1]
      }
    end
    TechnicalAnalysis::Bb.calculate(data)
  end
end