# frozen_string_literal: true

class Form::User::EditComponent < ViewComponent::Base
  def initialize(user:)
    @user = user
  end

end
