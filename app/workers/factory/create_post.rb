class Factory::CreatePost
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform
    User.all.sample.posts.create(
      content: Faker::Lorem.paragraph
    )
  end
end