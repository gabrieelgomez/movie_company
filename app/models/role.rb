# frozen_string_literal: true

# Role class
class Role < ApplicationRecord
  TYPES = %w[actor director producer].freeze

  has_many :casts
  has_many :movies, through: :casts
  has_many :people, through: :casts

  scope :actor, -> { find_by(name: 'actor') }
  scope :director, -> { find_by(name: 'director') }
  scope :producer, -> { find_by(name: 'producer') }

  validates :name, uniqueness: true
  validates :name, inclusion: { in: TYPES }

  def self.all_types
    {
      actor: Role.actor,
      director: Role.director,
      producer: Role.producer
    }
  end
end
