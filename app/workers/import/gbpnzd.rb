class Import::Gbpnzd
  include Sidekiq::Worker
  sidekiq_options retry: true

  def perform(event_data)
    data = JSON.parse(event_data)['tick']
    Gbpnzd.create(
      epoch: data['epoch'],
      quote: data['quote']
    )
  end
end