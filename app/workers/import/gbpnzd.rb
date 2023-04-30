class Import::Gbpnzd
  include Sidekiq::Worker
  sidekiq_options retry: true

  def perform(data)
    # Gbpnzd.create(
    #   ask: data['ask'],
    #   bid: data['bid'],
    #   quote: data['quote'],
    #   epoch: data['epoch']
    # )
  end
end