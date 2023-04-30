class Factory::CreateUser
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform
    User.create(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      password: 'password',
      password_confirmation: 'password'
    )
  end
end