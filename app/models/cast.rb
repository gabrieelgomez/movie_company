# frozen_string_literal: true

# Cast class
class Cast < ApplicationRecord
  belongs_to :movie
  belongs_to :person
  belongs_to :role

  validates :person_id,
            uniqueness: {
              message: "Can't be in a movie with the same role more than once",
              scope: %i[movie_id role_id]
            }.freeze
end
