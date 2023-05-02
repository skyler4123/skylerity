class GbpnzdM5
  include Mongoid::Document
  include Mongoid::Timestamps
  field :time, type: Time
  field :opened, type: BigDecimal
  field :high, type: BigDecimal
  field :low, type: BigDecimal
  field :close, type: BigDecimal
  field :change, type: BigDecimal
  field :percentage, type: BigDecimal

  def hammer?
    true
  end

  def shadow_ratio
    0.1
  end
end
