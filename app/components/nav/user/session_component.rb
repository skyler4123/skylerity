# frozen_string_literal: true

class Nav::User::SessionComponent < ViewComponent::Base
  def initialize(current_user:)
    @current_user = current_user
  end

  def render?
    !request.path.in?([signin_path, signup_path])
  end
end
