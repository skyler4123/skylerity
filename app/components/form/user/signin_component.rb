# frozen_string_literal: true

class Form::User::SigninComponent < ViewComponent::Base
  def initialize(url:)
    @url = url
  end
end
