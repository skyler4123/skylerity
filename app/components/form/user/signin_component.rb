# frozen_string_literal: true

class Form::User::SigninComponent < ViewComponent::Base
  def initialize(signin_path:, signup_path:)
    @signin_path = signin_path
    @signup_path = signup_path
  end
end
