# frozen_string_literal: true

# ApplicationRecord class
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  private

  def get_role(role_name)
    Role.find_by(name: role_name)
  end
end
