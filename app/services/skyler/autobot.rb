module Skyler
  module Autobot
    class UserService
      def self.create
        payload = {
          name: Faker::Name.name,
          email: Faker::Internet.email,
          password: 'password',
          password_confirmation: 'password',
        }
        ::User.create!(payload)
      end
    end

    class Post
      def self.create
        payload = {
          content: Faker::Games::Dota.quote,
        }
        User.all.sample.posts.create(payload)
      end
    end
    class Forex
      # Forex.clear_data(:gbpnzd, :eurusd, peroidic: 1.hours.ago, )
      def self.clear_data(*pair, peroidic:)
        # pair = [:gbpnzd, :eurusd]

        pair.each do |pair|
          pair.to_s.camelize.constantize.destroy_all(:created_at.lte => peroidic)
        end
      end
    end
  end
end