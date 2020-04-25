# frozen_string_literal: true

# UserSerializer class
class MovieSerializer < ActiveModel::Serializer
  attributes :id, :title, :release_year, :casting, :directors, :producers

  def casting
    object.casting
  end

  def directors
    object.people_as('director')
  end

  def producers
    object.people_as('producer')
  end
end
