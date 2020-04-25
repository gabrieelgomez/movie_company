# frozen_string_literal: true

# UserSerializer class
class PersonSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :aliases, :genre, :as_actor, :as_director,
             :as_producer

  def as_actor
    object.movies_as('actor')
  end

  def as_director
    object.movies_as('director')
  end

  def as_producer
    object.movies_as('producer')
  end
end
