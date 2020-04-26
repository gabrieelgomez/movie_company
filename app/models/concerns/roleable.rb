# frozen_string_literal: true

# Import from class Person methods
module Roleable
  extend ActiveSupport::Concern

  included do
    def has_role?(role_name)
      role_array = roles.where(name: role_name)
      role_array.any?
    end
  end
end
