class Gbpnzd
  include Mongoid::Document
  include Mongoid::Timestamps
  field :epoch, type: Integer
  field :quote, type: BigDecimal

  after_create :m5

  def m5
    
  end
end
