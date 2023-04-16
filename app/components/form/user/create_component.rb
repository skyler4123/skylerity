# frozen_string_literal: true

class Form::User::CreateComponent < ViewComponent::Base
  def initialize
    @user = User.new
  end
end
