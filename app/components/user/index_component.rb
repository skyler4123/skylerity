# frozen_string_literal: true

class User::IndexComponent < ViewComponent::Base
  def initialize(users:)
    @users = users
  end

end
