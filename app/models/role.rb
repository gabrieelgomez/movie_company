# frozen_string_literal: true

# Role class
class Role < ApplicationRecord
  TYPES = %w[actor director producer].freeze

  has_many :casts
  has_many :movies, through: :casts
  has_many :people, through: :casts

  validates :name, uniqueness: true
  validates :name, inclusion: { in: TYPES }
end
