# frozen_string_literal: true

class User::ShowComponent < ViewComponent::Base
  with_collection_parameter :user
  def initialize(user:)
    @user = user
  end

end
