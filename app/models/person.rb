# frozen_string_literal: true

# Person class
class Person < ApplicationRecord
  include Roleable

  GENRES = %w[male female].freeze

  has_and_belongs_to_many :roles
  has_and_belongs_to_many :movies

  accepts_nested_attributes_for :people_roles

  validates :first_name, :last_name, :aliases, presence: true
  validates :genre,
            inclusion: GENRES,
            allow_nil: false

  # Get movies by person's role
  def movies_as(role_name)
    movies.includes(people: [:roles])
          .where(roles: { name: role_name&.singularize })
  end
end
