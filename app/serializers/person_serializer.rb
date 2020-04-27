# frozen_string_literal: true

# PersonSerializer class
class PersonSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :aliases, :genre, :movies_as_actor,
             :movies_as_director, :movies_as_producer

  def movies_as_actor
    object.movies_as('actor')
  end

  def movies_as_director
    object.movies_as('director')
  end

  def movies_as_producer
    object.movies_as('producer')
  end
end
