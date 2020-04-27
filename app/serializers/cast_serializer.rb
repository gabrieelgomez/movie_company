# frozen_string_literal: true

# CastSerializer class
class CastSerializer < ActiveModel::Serializer
  attributes :id, :person, :movie, :role
end
