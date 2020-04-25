# frozen_string_literal: true

# UserSerializer class
class MovieSerializer < ActiveModel::Serializer
  attributes :id, :title, :release_year, :actors, :directors, :producers

  def actors
    object.people_as('actor')
  end

  def directors
    object.people_as('director')
  end

  def producers
    object.people_as('producer')
  end
end
