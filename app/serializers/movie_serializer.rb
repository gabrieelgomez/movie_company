# frozen_string_literal: true

# UserSerializer class
class MovieSerializer < ActiveModel::Serializer
  attributes :id, :title, :release_year, :release_roman, :casting, :directors, :producers

  def release_roman
    object.release_year.to_roman
  end

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
