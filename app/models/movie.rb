# frozen_string_literal: true

# Movie class
class Movie < ApplicationRecord
  has_many :casts
  has_many :people, through: :casts
  has_many :roles, through: :casts

  validates :title, :release_year, presence: true

  # Get all records by roles, actors, directors, producers
  def people_as(role_name)
    # doesn't work people.includes(casts: [:role])
    #                    .where(casts: { role: { name: role_name } } )
    role = Role.find_by(name: role_name)
    people.includes({ casts: [:role] }).where(casts: { role: role })
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
