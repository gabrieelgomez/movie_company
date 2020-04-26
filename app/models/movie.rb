# frozen_string_literal: true

# Movie class
class Movie < ApplicationRecord
  has_and_belongs_to_many :people

  validates :title, :release_year, presence: true

  # Get all records by roles, actors, directors, producers
  def people_as(role_name)
    people.includes(:roles).where(roles: { name: role_name&.singularize })
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
