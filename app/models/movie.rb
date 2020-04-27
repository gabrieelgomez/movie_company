# frozen_string_literal: true

# Movie class
class Movie < ApplicationRecord
  has_many :casts, dependent: :destroy
  has_many :people, through: :casts
  has_many :roles, through: :casts

  validates :title, :release_year, presence: true

  accepts_nested_attributes_for :casts, allow_destroy: true

  # Get all records by roles, actors, directors, producers
  def people_as(role_name)
    people.includes(casts: :role).where({ roles: { name: role_name } })
  end

  # Get people records with male genre
  def actors
    people_as('actor').where(genre: 'male')
  end

  # Get people records with female genre
  def actresses
    people_as('actor').where(genre: 'female')
  end

  # Get list of actors and actresses one movie
  def casting
    {
      actors: actors,
      actresses: actresses
    }
  end
end
