# frozen_string_literal: true

# Movie class
class Movie < ApplicationRecord
  has_and_belongs_to_many :people

  validates :title, :release_year, presence: true

  def people_as(role_name)
    people.includes(:roles).where(roles: { name: role_name&.singularize })
  end

  def actors
    people_as('actor').where(genre: 'male')
  end

  def actresses
    people_as('actor').where(genre: 'female')
  end

  def casting
    {
      actors: actors,
      actresses: actresses
    }
  end
end
