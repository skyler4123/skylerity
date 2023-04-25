module Autobot
  class User
    def self.create
      payload = {
        name: Faker::Name.name,
        email: Faker::Internet.email,
        password: 'password',
        password_confirmation: 'password',
      }
      User.create!(payload)
    end
  end

  class Post
    def.create
      payload = {
        content: Faker::Games::Dota.quote,
      }
      User.all.sample.
    end
  end
end