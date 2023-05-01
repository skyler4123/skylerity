class GbpnzdM5
  include Mongoid::Document
  include Mongoid::Timestamps
  field :time, type: Time
  field :open, type: String
  field :high, type: String
  field :low, type: String
  field :close, type: String
  field :change, type: String
  field :percentage, type: String
  field :bb_upper, type: String
  field :bb_middle, type: String
  field :bb_lower, type: String
end
