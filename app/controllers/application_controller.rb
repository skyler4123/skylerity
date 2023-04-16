class ApplicationController < ActionController::Base
  include Skyler::Authenticate
  include Skyler::JsonWebToken
end
