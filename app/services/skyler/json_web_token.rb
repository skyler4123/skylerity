module Skyler
  module JsonWebToken
    EXP = ENV['TOKEN_EXPIRATION']
    SECRET = ENV['JWT_HMAC_SECRET']

    def self.encode(user)
      payload = {
        id: user.id,
        email: user.email,
        exp: EXP.to_i.minutes.from_now.to_i
      }
      JWT.encode(payload, SECRET, 'HS256')
    end
  
    def self.decode(token)
      JWT.decode(token, SECRET, true, { algorithm: 'HS256' })
    end

  end
end