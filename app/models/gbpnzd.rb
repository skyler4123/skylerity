class Gbpnzd
  include Mongoid::Document
  include Mongoid::Timestamps
  field :epoch, type: Integer
  field :quote, type: BigDecimal
end
