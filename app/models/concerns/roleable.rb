# frozen_string_literal: true

# Import from class Person methods
module Roleable
  extend ActiveSupport::Concern

  included do
    def has_role?(role_name)
      role_array = roles.where(name: role_name)

      return false if role_array.empty?

      role_array != []
    end
  end
end
