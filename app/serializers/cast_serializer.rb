# frozen_string_literal: true

# CastSerializer class
class CastSerializer < ActiveModel::Serializer
  attributes :id, :person, :role

  belongs_to :movie
end
