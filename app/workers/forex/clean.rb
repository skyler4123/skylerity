class Forex::Clean
  include Sidekiq::Worker
  sidekiq_options retry: true

  def perform
    Gbpnzd.delete_all(:created_at.lt => 2.hours.ago)
  end
end