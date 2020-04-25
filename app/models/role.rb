# frozen_string_literal: true

# Role class
class Role < ApplicationRecord
  has_and_belongs_to_many :people

  validates :name, uniqueness: true
end
