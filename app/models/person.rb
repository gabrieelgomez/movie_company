# frozen_string_literal: true

# Person class
class Person < ApplicationRecord
  include Roleable

  GENRES = %w[male female].freeze

  has_many :casts
  has_many :movies, through: :casts
  has_many :roles, through: :casts

  validates :first_name, :last_name, :aliases, presence: true
  validates :genre,
            inclusion: GENRES,
            allow_nil: false

  # Get movies by person's role
  def movies_as(role_name)
    # doesn't work movies.includes(casts: [:role])
    #                    .where(casts: { role: { name: role_name } } )
    role = Role.find_by(name: role_name)
    movies.includes({ casts: [:role] }).where(casts: { role: role })
  end
end
