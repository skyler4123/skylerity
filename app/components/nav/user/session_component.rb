# frozen_string_literal: true

class Nav::User::SessionComponent < ViewComponent::Base
  def initialize(current_user:)
    @current_user = current_user
  end
end
